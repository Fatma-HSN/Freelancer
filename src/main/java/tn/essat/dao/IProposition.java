package tn.essat.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.Proposition;

@Repository
public interface IProposition extends JpaRepository<Proposition, Integer> {
    List<Proposition> findByProjId(Integer projId); 
    List<Proposition> findByFreelancerId(Integer freelancerId);
    }


