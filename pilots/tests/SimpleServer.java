package pilots.tests;

import java.net.*;
import java.io.*;
import pilots.runtime.*;

public class SimpleServer {

    public static void main( String[] args ) {
        int serverPort = Integer.parseInt( args[0] );

        try {
            ServerSocket serverSock = new ServerSocket( serverPort );
            System.out.println( "Started listening to port:" + serverPort );

            Socket newSock = serverSock.accept();
            BufferedReader in = new BufferedReader( new InputStreamReader( newSock.getInputStream() ) );
            String str = null, varNames = null;

            System.out.println( "Connection accepted" );

            while ( (str = in.readLine() ) != null ) {
                if ( str.length() == 0 ) {
                    System.out.println( "EOS marker received" );
                    break;
                }
                else {
                    // just print the value
                    System.out.println( str );
                }

            }

            System.out.println( "Server is going to exit" );

            in.close();
            newSock.close();

        } catch (Exception ex ) {
            ex.printStackTrace();
        }
    }

}