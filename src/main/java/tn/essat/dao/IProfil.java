package tn.essat.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.Profil;
import tn.essat.model.Project;
import tn.essat.model.User;

@Repository
public interface IProfil extends JpaRepository<Profil, Integer> {
    Optional<Profil> findByFreelancer(User freelancer); 
    Optional<Profil> findByFreelancerId(Integer freelancerId);
}

