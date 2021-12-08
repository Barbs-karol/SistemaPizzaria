
package DAO;

import Beans.ClienteBeans;
import Utilitarios.Conexao;
import Utilitarios.Corretores;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class ClienteDAO {
    public ClienteDAO(){
        
    }
    
    public void cadastrarCliente(ClienteBeans Cliente){
        try {
            String SQLInsertion = "insert into clientes(cli_nome, cli_rua, cli_bairro, cli_telefone, cli_data_cad) values (?,?,?,?,?)";
            PreparedStatement st = Conexao.getConnection().prepareStatement(SQLInsertion);
            st.setString(1, Cliente.getNome());
            st.setString(2, Cliente.getRua());
            st.setString(3, Cliente.getBairro());
            st.setString(4, Cliente.getTelefone());
            st.setString(5, Corretores.ConverterParaSQL(Cliente.getDataCad()));
            
            st.execute();
            Conexao.getConnection().commit();
            
            JOptionPane.showMessageDialog(null, "Registro salvo com sucesso", "Salvo", 1, new ImageIcon("Imagens/ok.png"));
            
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar", "Erro", 0, new ImageIcon("Imagens/sair.png"));
            //JOptionPane.showMessageDialog(null, ex, "Erro", 0, new ImageIcon("Imagens/sair.png"));
        }
    }
    
    public String proximoCliente(){
            String SQLSelection = "select * from clientes order by cli_cod desc limit 1";
        try {
            PreparedStatement st =  Conexao.getConnection().prepareStatement(SQLSelection);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                return (Integer.parseInt(rs.getString("cli_cod")) + 1) + ""; 
            } else {
                return "1";
            }
            
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao buscar registro", "Erro", 0, new ImageIcon("Imagens/sair.png"));
             return "0";
        }
        
    }
    
    public void buscarCliente(String Pesquisa, DefaultTableModel Modelo){
        
        try {
            String SQLSelection = "select * from clientes where cli_nome like '%" + Pesquisa + "%' ";
            PreparedStatement st = Conexao.getConnection().prepareStatement(SQLSelection);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Modelo.addRow(new Object[] {rs.getString("cli_cod"), rs.getString("cli_nome"), rs.getString("cli_rua"), rs.getString("cli_bairro"), rs.getString("cli_telefone")});
                
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao buscar cliente", "Erro", 0, new ImageIcon("Imagens/sair.png"));
        }
        
    }
}
