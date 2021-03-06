package com.ifpb.bestplaces.interfaces;

import com.ifpb.bestplaces.entidades.Mensagem;
import com.ifpb.bestplaces.entidades.Usuario;
import java.sql.SQLException;
import java.util.List;

public interface IMensagemDAO {

    public boolean insert(Mensagem m)
            throws SQLException, ClassNotFoundException;

    public int countUserMensseger(String destinatario)
            throws SQLException, ClassNotFoundException;

    public List<Usuario> findUserMessenger(String destinatario)
            throws SQLException, ClassNotFoundException;

    public List<Mensagem> findMessages(String remetente, String destinatario)
            throws SQLException, ClassNotFoundException;

}
