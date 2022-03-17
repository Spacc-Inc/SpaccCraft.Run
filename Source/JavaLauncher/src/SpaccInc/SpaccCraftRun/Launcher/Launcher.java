/* ==================================== |
| SpaccCraft.Run One-click Launcher     |
| Copyright (C) 2022, OctoSpacc (GPLv3) |
| ==================================== */
package SpaccInc.SpaccCraftRun.Launcher;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Launcher extends javax.swing.JFrame {
    public Launcher() {
        initComponents();
    }
    
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        UsernameLabel = new javax.swing.JLabel();
        UsernameField = new javax.swing.JTextField();
        PlayButton = new javax.swing.JButton();
        HelpLabel = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("SpaccCraft.Run Launcher");
        setResizable(false);

        UsernameLabel.setText("Username:");

        UsernameField.setToolTipText("Minecraft Username");
        UsernameField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                UsernameFieldActionPerformed(evt);
            }
        });

        PlayButton.setText("Play!");
        PlayButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                PlayButtonActionPerformed(evt);
            }
        });

        HelpLabel.setText("Tip: Type your Minecraft Username and hit Play!");

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(PlayButton, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(layout.createSequentialGroup()
                        .add(UsernameLabel)
                        .add(10, 10, 10)
                        .add(UsernameField))
                    .add(layout.createSequentialGroup()
                        .add(HelpLabel)
                        .add(0, 4, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(UsernameLabel)
                    .add(UsernameField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(PlayButton)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 15, Short.MAX_VALUE)
                .add(HelpLabel)
                .addContainerGap())
        );

        getAccessibleContext().setAccessibleName("SpaccCraft.Run Launcher");

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private static void StartProcess(String[] Cmd) {
        ProcessBuilder pb = new ProcessBuilder(Cmd);
        try {
            System.out.println("Starting game..");
            Process p = pb.start();
        } catch (IOException e) {
            System.out.println("Error: Can't start game process!");
        }
    }
    
    private static void Play() {
        String OS = System.getProperty("os.name").toLowerCase();
        if (OS.contains("win")) {
            String[] Cmd = {"GameBoot.bat"};
            StartProcess(Cmd);
        } else if (OS.contains("linux")) {
            String[] Cmd = {"./GameBoot.sh"};
            StartProcess(Cmd);
        } else {
            System.out.println("Error: Your OS (detected: " + OS + ") is unsupported!");
        }
    }
    
    private static String LoadUsername() {
        try {
            File FileObj = new File("Username.txt");
            Scanner File = new Scanner(FileObj);
            while (File.hasNextLine()) {
                return File.nextLine();
            }
            File.close();
        } catch (FileNotFoundException e) {
            System.out.println("Error: Can't read a saved Username! Loading GUI config..");
        }
        return "";
    }
    
    private static boolean SaveUsername(String Username) {
        try {
            FileWriter File = new FileWriter("Username.txt");
            File.write(Username);
            File.close();
            System.out.println("Username (" + Username + ") saved!");
            return true;
        } catch (IOException e) {
            System.out.println("Error: Username not saved!");
        }
        return false;
    }
    
    private void UsernameFieldActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_UsernameFieldActionPerformed
        
    }//GEN-LAST:event_UsernameFieldActionPerformed

    private void PlayButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_PlayButtonActionPerformed
        String Username = UsernameField.getText();
        if (Username.isEmpty()) {
            System.out.println("Error: Please input a valid Username!");
        } else {
            SaveUsername(Username);
            Play();
        }
    }//GEN-LAST:event_PlayButtonActionPerformed

    public static void main(String args[]) {
        final String[] fargs = args;
        
        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                boolean ConfigCalled = false;
                for (int i=0; i<fargs.length; i++) {
                    if ("-Config".equals(fargs[i])) {
                        ConfigCalled = true;
                    }
                }
                String Username = LoadUsername();
                if (Username.isEmpty()) {
                    ConfigCalled = true;
                }
                if (ConfigCalled) {
                    new Launcher().setVisible(true);
                } else {
                    Play();
                }
            }
        });
    }
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel HelpLabel;
    private javax.swing.JButton PlayButton;
    private javax.swing.JTextField UsernameField;
    private javax.swing.JLabel UsernameLabel;
    // End of variables declaration//GEN-END:variables
}
