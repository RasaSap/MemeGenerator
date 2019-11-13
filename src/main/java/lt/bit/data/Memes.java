/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.data;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Lenovo
 */
@Entity
@Table(name = "memes")
@NamedQueries({
    @NamedQuery(name = "Memes.findAll", query = "SELECT m FROM Memes m"),
    @NamedQuery(name = "Memes.findById", query = "SELECT m FROM Memes m WHERE m.id = :id")})
public class Memes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Lob
    @Column(name = "meme")
    private byte[] meme;

    public Memes() {
    }

    public Memes(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public byte[] getMeme() {
        return meme;
    }
    
    public String getEncodedMeme() {
        String encodedPhoto = Base64.encode(getMeme());
        return encodedPhoto;
    }

    public void setMeme(byte[] meme) {
        this.meme = meme;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Memes)) {
            return false;
        }
        Memes other = (Memes) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "lt.bit.data.Memes[ id=" + id + " ]";
    }  
}
