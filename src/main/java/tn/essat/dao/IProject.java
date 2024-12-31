package tn.essat.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.essat.model.Project;


@Repository
public interface IProject extends JpaRepository<Project, Integer> {
    List<Project> findByClientId(Integer clientId);
    List<Project> findByFreelancerId(Integer freelancerId);
}


