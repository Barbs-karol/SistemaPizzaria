
package GUI;

import Utilitarios.FundoTela;
import java.awt.GridLayout;
import javax.swing.JFrame;

/**
 *
 * @author USER-64
 */
public class Principal extends javax.swing.JFrame {

      FundoTela tela;
      ClienteTela clientetela;
  
    public Principal() {
        initComponents();
        setExtendedState(JFrame.MAXIMIZED_BOTH);
        setLayout(new GridLayout());
        tela = new FundoTela ("imagens/fundoImage.jpeg");
        getContentPane().add(tela);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jMenuBar1 = new javax.swing.JMenuBar();
        menuFuncionarios = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();
        menuFuncionario = new javax.swing.JMenuItem();
        menuCardapio = new javax.swing.JMenuItem();
        menuEntregador = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        jMenuItem5 = new javax.swing.JMenuItem();
        jMenu4 = new javax.swing.JMenu();
        jMenu3 = new javax.swing.JMenu();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Pizzaria++");

        menuFuncionarios.setText("Cadastro");
        menuFuncionarios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuFuncionariosActionPerformed(evt);
            }
        });

        jMenuItem1.setText("Clientes");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        menuFuncionarios.add(jMenuItem1);

        menuFuncionario.setText("Funcionarios");
        menuFuncionarios.add(menuFuncionario);

        menuCardapio.setText("Cardapio");
        menuFuncionarios.add(menuCardapio);

        menuEntregador.setText("Entregador");
        menuFuncionarios.add(menuEntregador);

        jMenuBar1.add(menuFuncionarios);

        jMenu2.setText("Caixa");

        jMenuItem5.setText("Pedidos");
        jMenu2.add(jMenuItem5);

        jMenuBar1.add(jMenu2);

        jMenu4.setText("Relatorios");
        jMenuBar1.add(jMenu4);

        jMenu3.setText("Sair");
        jMenuBar1.add(jMenu3);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 279, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    
    
    private void menuFuncionariosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuFuncionariosActionPerformed

    }//GEN-LAST:event_menuFuncionariosActionPerformed

    
    
    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        clientetela =  new ClienteTela();
        tela.add(clientetela);
        clientetela.setVisible(true);
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Principal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem5;
    private javax.swing.JMenuItem menuCardapio;
    private javax.swing.JMenuItem menuEntregador;
    private javax.swing.JMenuItem menuFuncionario;
    private javax.swing.JMenu menuFuncionarios;
    // End of variables declaration//GEN-END:variables

    private Object getContentePane() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
