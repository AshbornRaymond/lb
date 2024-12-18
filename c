// TCP Server Program
import java.net.*;
import java.io.*;
public class tcpser {
    public static void main(String args[]) throws Exception {
        ServerSocket sersock = new ServerSocket(4000);
        Socket sock = sersock.accept();
        InputStream istream = sock.getInputStream();
        BufferedReader fileRead = new BufferedReader(new InputStreamReader(istream));
        String fname = fileRead.readLine();
        BufferedReader contentRead = new BufferedReader(new FileReader(fname));
        OutputStream ostream = sock.getOutputStream();
        PrintWriter pwrite = new PrintWriter(ostream, true);
        String str;
        while ((str = contentRead.readLine()) != null) {
            pwrite.println(str);
        }
    }
}

// TCP Client Program
import java.net.*;
import java.io.*;
public class tcpcl {
    public static void main(String args[]) throws Exception {
        Socket sock = new Socket("127.0.0.1", 4000);
        BufferedReader keyRead = new BufferedReader(new InputStreamReader(System.in));
        String fname = keyRead.readLine();
        OutputStream ostream = sock.getOutputStream();
        PrintWriter pwrite = new PrintWriter(ostream, true);
        pwrite.println(fname);
        InputStream istream = sock.getInputStream();
        BufferedReader SocketRead = new BufferedReader(new InputStreamReader(istream));
        String str;
        while ((str = SocketRead.readLine()) != null) {
            System.out.println(str);
        }
        pwrite.close();
        SocketRead.close();
        keyRead.close();
    }
}

// UDP Server Program
import java.io.*;
import java.net.*;
class udpser {
    public static void main(String args[]) throws Exception {
        DatagramSocket serversocket = new DatagramSocket(9876);
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        byte[] receiveData = new byte[1024];
        byte[] sendData = new byte[1024];
        DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
        serversocket.receive(receivePacket);
        String sentence = new String(receivePacket.getData());
        InetAddress IPaddress = receivePacket.getAddress();
        int port = receivePacket.getPort();
        String data = br.readLine();
        sendData = data.getBytes();
        DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, IPaddress, port);
        serversocket.send(sendPacket);
        serversocket.close();
    }
}

// UDP Client Program
import java.io.*;
import java.net.*;
class udpcl {
    public static void main(String[] args) throws Exception {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        DatagramSocket clientsocket = new DatagramSocket();
        InetAddress IPaddress = InetAddress.getByName("localhost");
        byte[] sendData = new byte[1024];
        byte[] receiveData = new byte[1024];
        String sentence = "hello server";
        sendData = sentence.getBytes();
        DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, IPaddress, 9876);
        clientsocket.send(sendPacket);
        DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
        clientsocket.receive(receivePacket);
        clientsocket.close();
    }
}

// CRC Program
import java.util.*;
public class CRC {
    public static void main(String args[]) {
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the size of the data:");
        int n = s.nextInt();
        int data[] = new int[n];
        System.out.println("Enter the data, bit by bit:");
        for (int i = 0; i < n; i++) {
            data[i] = s.nextInt();
        }
        System.out.println("Enter the size of the divisor:");
        int divisorLength = s.nextInt();
        int divisor[] = new int[divisorLength];
        System.out.println("Enter the divisor, bit by bit:");
        for (int i = 0; i < divisorLength; i++) {
            divisor[i] = s.nextInt();
        }
        int remainder[] = divide(data, divisor);
        System.out.println("\nThe CRC code generated is:");
        for (int i = 0; i < data.length; i++) {
            System.out.print(data[i]);
        }
        for (int i = 0; i < remainder.length - 1; i++) {
            System.out.print(remainder[i]);
        }
        System.out.println();
        int sentData[] = new int[data.length + remainder.length - 1];
        System.out.println("Enter the data to be sent (with CRC code appended):");
        for (int i = 0; i < sentData.length; i++) {
            sentData[i] = s.nextInt();
        }
        receive(sentData, divisor);
    }

    static int[] divide(int oldData[], int divisor[]) {
        int dataLength = oldData.length;
        int divisorLength = divisor.length;
        int data[] = new int[dataLength + divisorLength - 1];
        System.arraycopy(oldData, 0, data, 0, dataLength);
        int remainder[] = new int[divisorLength];
        System.arraycopy(data, 0, remainder, 0, divisorLength);
        for (int i = 0; i < dataLength; i++) {
            if (remainder[0] == 1) {
                for (int j = 1; j < divisorLength; j++) {
                    remainder[j - 1] = exor(remainder[j], divisor[j]);
                }
            } else {
                for (int j = 1; j < divisorLength; j++) {
                    remainder[j - 1] = exor(remainder[j], 0);
                }
            }
            remainder[divisorLength - 1] = data[i + divisorLength];
        }
        return remainder;
    }

    static int exor(int a, int b) {
        return (a == b) ? 0 : 1;
    }

    static void receive(int data[], int divisor[]) {
        int remainder[] = divide(data, divisor);
        for (int i = 0; i < remainder.length; i++) {
            if (remainder[i] != 0) {
                System.out.println("There is an error in the received data");
                return;
            }
        }
        System.out.println("Data was received without any error");
    }
}

// Leaky Bucket Program
import java.util.*;
import java.util.Random;
public class leaky_bucket {
    public static void main(String[] args) {
        int drop = 0, mini, i, o_rate, b_size, nsec, p_remain = 0;
        int packet[] = new int[100];
        Scanner in = new Scanner(System.in);
        b_size = in.nextInt();
        o_rate = in.nextInt();
        nsec = in.nextInt();
        Random rand = new Random();
        for (i = 0; i < nsec; i++)
            packet[i] = (rand.nextInt(1000));
        System.out.println("seconds|packet received|packet sent|packets left|packets dropped");
        for (i = 0; i < nsec; i++) {
            p_remain += packet[i];
            if (p_remain > b_size) {
                drop = p_remain - b_size;
                p_remain = b_size;
            }
            mini = Math.min(p_remain, o_rate);
            p_remain -= mini;
            drop = 0;
        }
        while (p_remain != 0) {
            mini = Math.min(p_remain, o_rate);
            p_remain -= mini;
        }
    }
}
