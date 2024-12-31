package tn.essat.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tn.essat.dao.IProfil;
import tn.essat.dao.IProject;
import tn.essat.dao.IProposition;
import tn.essat.dao.IRole;
import tn.essat.dao.IUser;
import tn.essat.model.Profil;
import tn.essat.model.Project;
import tn.essat.model.Proposition;
import tn.essat.model.Role;
import tn.essat.model.User;

@Controller
public class AppCRT {

	@Autowired
	IProject dao_project;
	@Autowired
	IUser dao_user;
	@Autowired
	IProposition dao_proposition;

	@Autowired
	IProfil dao_profil;
	@Autowired
	IRole dao_role;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@RequestMapping(value = "/login",

			method = { RequestMethod.POST, RequestMethod.GET })

	public String f4(@RequestParam(value = "error", required = false) String error

			, Model model) {

		String msg = null;
		if (error != null) {
			msg =

					"Username or Password is incorrect !!";
		}

		model.addAttribute("errorMessge", msg);
		return "login";
	}

	@GetMapping("/RegisterFreelancer")
	public String registreFreelancer(Model m) {

		User user = new User();
		m.addAttribute("user", user);

		return "inscription_freelancer";

	}

	@GetMapping("/RegisterClient")
	public String registreClint(Model m) {

		User user = new User();
		m.addAttribute("user", user);

		return "inscription_client";

	}

	@GetMapping("/")
	public String f1(Model m) {
		List<Project> projs = dao_project.findAll();
		m.addAttribute("projs", projs);
		return "listes_projets";

	}

	@GetMapping("/project/{id}")
	public String f7(Model m, @PathVariable int id) {
		Optional<Project> proj = dao_project.findById(id);
		m.addAttribute("proj", proj.get());
		return "detail_project";

	}

	@PostMapping("/saveProposition")
	public String f55(Model m, @ModelAttribute Proposition prp) {
		dao_proposition.save(prp);
		return "redirect:/";
	}

	@GetMapping("/projects/client/{id}")
	public String getProjClt(Model m, @PathVariable int id) {
		{
			List<Project> liste = dao_project.findByClientId(id);
			m.addAttribute("liste", liste);
			return "projets_clients";
		}
	}
	@GetMapping("/projects/freelancer/{id}")
	public String getFreelancerProjects(Model m, @PathVariable int id) {
	    List<Project> projects = dao_project.findByFreelancerId(id);
	    m.addAttribute("projects", projects);
	    return "projets_freelancer";
	}
	

	

	@PostMapping("/saveprofil")
	public String saveprofil(Model m, @ModelAttribute Profil profil)

	{

		dao_profil.save(profil);
		return "redirect:/";

	}
	
	
	@PostMapping("/saveFreelancer")
	public String registerFreelancer(Model m, @ModelAttribute User user) {
		Role freelancerRole = dao_role.findByRole("FREELANCER");
		user.setRole(freelancerRole);
		user.setEnabled(true);
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		dao_user.save(user);
		return "redirect:/login";

	}
	
	@PostMapping("/saveClient")
	public String registerClient(Model m, @ModelAttribute User user) {

		Role clientRole = dao_role.findByRole("CLIENT");
		user.setRole(clientRole);
		user.setEnabled(true);
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		dao_user.save(user);
		return "redirect:/login";
	}
	@GetMapping("/addProfil")
	public String showAddProfilForm(Model m) {
	    Profil profil = new Profil();
	    m.addAttribute("profil", profil);
	    return "add_profil";
	}

	@GetMapping("/profil/{id}")
	public String getProfil(Model m, @PathVariable int id) {
	    Optional<Profil> profil = dao_profil.findByFreelancerId(id);
	    if (profil.isPresent()) {
	        m.addAttribute("profil", profil.get());
	        return "profil";
	    } else {
	        return "redirect:/";
	    }
	}
	@GetMapping("/propositions/project/{id}")
	public String getPropositionsByProjectId(Model model, @PathVariable Integer id) {
	    List<Proposition> propositions = dao_proposition.findByProjId(id);
	    model.addAttribute("propositions", propositions);
	    return "propositions_list";
	}



}
