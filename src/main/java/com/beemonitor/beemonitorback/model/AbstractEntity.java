package com.beemonitor.beemonitorback.model;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;

import java.io.Serializable;

/**
 * Classe abstraite qui represente toutes les entites. <br/>
 */
@MappedSuperclass
public class AbstractEntity implements Serializable {

    // Permet d'utiliser la sérialisation en flux binaire (en Java) <=> identifiant de l'objet
    // Historique, plus d'actualité, écrit pour éviter un warning
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * Constructeur de l'objet. <br>
     */
    protected AbstractEntity() {
        this(null);
    }


    /**
     * Constructeur de l'objet. <br>
     *
     * @param pId l'id d'un compte
     */
    protected AbstractEntity(Integer pId) {
        super();
        this.setId(pId);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer pId) {
        this.id = pId;
    }

    /**
     * Renvoie le hashcode de la string this.getClass().getName() + "-" + this.getId()
     */
    @Override
    public int hashCode() {
        if (this.getId() != null) {
            return (this.getClass().getName() + "-" + this.getId()).hashCode();
        }
        return super.hashCode();
    }

    /**
     * Renvoie true si les objets comparés sont identiques ou que leurs id sont identiques
     */
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (obj instanceof AbstractEntity && this.getClass() == obj.getClass()) {
            return ((AbstractEntity) obj).getId() == this.getId()
                    || ((AbstractEntity) obj).getId().equals(this.getId());
        }
        return false;
    }

    @Override
    public String toString() {
        return "AbstractEntity{" +
                "id = " + id +
                '}';
    }

}
