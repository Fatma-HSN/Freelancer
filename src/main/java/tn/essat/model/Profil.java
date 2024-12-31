package tn.essat.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;



@Entity
public class Profil {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String biographie; 
    private String competences;
    private Integer nba;

    @ManyToOne
    @JoinColumn(name = "freelancer_id")
    private User freelancer;

    // Constructeurs, getters et setters...
    public Profil() {
        super();
    }

    public Profil(Integer id, String biographie, String competences, Integer nba, User freelancer) {
        super();
        this.id = id;
        this.biographie = biographie;
        this.competences = competences;
        this.nba = nba;
        this.freelancer = freelancer;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBiographie() {
        return biographie;
    }

    public void setBiographie(String biographie) {
        this.biographie = biographie;
    }

    public String getCompetences() {
        return competences;
    }

    public void setCompetences(String competences) {
        this.competences = competences;
    }

    public Integer getNba() {
        return nba;
    }

    public void setNba(Integer nba) {
        this.nba = nba;
    }

    public User getFreelancer() {
        return freelancer;
    }

    public void setFreelancer(User freelancer) {
        this.freelancer = freelancer;
    }
}
