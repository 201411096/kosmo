package com.mycompany.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class ExecuteCommand {
   public static void executeCommand(String command) {
      Runtime runtime = Runtime.getRuntime();
      Process process = null;
      try {
         process = runtime.exec(command);
         BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
         String line = null;
         while((line = br.readLine())!=null) {
            System.out.println(line);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            process.getErrorStream().close();    // ���μ����� stream�� �����
            process.getInputStream().close();    // ���μ����� stream�� �����
            process.getOutputStream().close();   // ���μ����� stream�� �����
            process.waitFor();               	 // ���μ��� ���Ḧ ��ٸ�
         }catch(Exception e){
            e.printStackTrace();
         }
      }
   }
}
