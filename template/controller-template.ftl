package ${packageName}.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import ${packageName}.model.${name};
import ${packageName}.services.${name}Service;

@Controller
@RequestMapping(value = "/${name?lower_case}")
public class ${name}Controller {
	@Autowired
	private ${name}Service ${name?lower_case}Service;

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView new${name}Page() {
		ModelAndView mav = new ModelAndView("${name?lower_case}-new", "${name?lower_case}", new ${name}());
		return mav;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createNew${name}(@ModelAttribute ${name} ${name?lower_case}, final RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("welcome");
		${name?lower_case}Service.create(${name?lower_case});
		String message = "Team was successfully added.";
		modelAndView.addObject("message", message);
		return modelAndView;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView ${name?lower_case}ListPage() {
		ModelAndView modelAndView = new ModelAndView("${name?lower_case}-list");
		List<${name}> ${name?lower_case}s = ${name?lower_case}Service.findAll();
		modelAndView.addObject("${name?lower_case}s", ${name?lower_case}s);
		return modelAndView;
	}
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView edit${name}Page(@PathVariable Long id) {
		ModelAndView modelAndView = new ModelAndView("${name?lower_case}-edit");
		${name} ${name?lower_case} = ${name?lower_case}Service.findById(id);
		modelAndView.addObject("${name?lower_case}", ${name?lower_case});
		return modelAndView;
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public ModelAndView edit${name}(@ModelAttribute ${name} ${name?lower_case}, @PathVariable Long id,
			final RedirectAttributes redirectAttributes) throws Exception {
		ModelAndView modelAndView = new ModelAndView("welcome");
		${name?lower_case}Service.update(${name?lower_case});
		String message = "${name} was successfully edited.";
		modelAndView.addObject("message", message);
		return modelAndView;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView delete${name}(@PathVariable Long id, final RedirectAttributes redirectAttributes)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView("welcome");
		${name?lower_case}Service.delete(id);
		String message = "${name} was successfully deleted.";
		modelAndView.addObject("message", message);
		return modelAndView;
	}
	
	@RequestMapping(value="api/list", method = RequestMethod.GET)
	@ResponseBody
	public  List<${name}>  ${name?lower_case}ListJson() {
		List<${name}> ${name?lower_case}s = ${name?lower_case}Service.findAll();
		return ${name?lower_case}s;
	}

}
