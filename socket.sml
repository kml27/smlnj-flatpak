structure Main =
struct
fun connect port =
let
    val localhost =
                valOf(NetHostDB.fromString "127.0.0.1")
    val addr = INetSock.toAddr(localhost, port)
    val sock = INetSock.TCP.socket()
    fun call sock =
    let
        val _ = Socket.connect(sock, addr)
        val msg = Socket.recvVec(sock, 1000)
        val text = Byte.bytesToString msg
    in
        print text;
        Socket.close sock
    end
    handle x => (Socket.close sock; raise x)
in
    call sock
end
handle OS.SysErr (msg, _) => raise Fail (msg ^ "\n")

fun toErr msg = TextIO.output(TextIO.stdErr, msg)

fun main(arg0, argv) =
let
in
    case argv of
    [port] =>
        (case Int.fromString port of
          NONE => raise Fail "Invalid port number\n"
        | SOME p => connect p)
        | _ => raise Fail "Usage: simpletcp port\n";
        OS.Process.success
end
handle
    Fail msg => (toErr msg; OS.Process.failure)
| x =>
(
    toErr(concat["Uncaught exception: ",
                exnMessage x, " from\n"]);
    app (fn s => (print "\t"; print s; print "\n"))
    (SMLofNJ.exnHistory x);
    OS.Process.failure
)
end