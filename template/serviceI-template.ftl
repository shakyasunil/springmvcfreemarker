package ${packageName}.services;

import java.util.List;


import ${packageName}.model.${name};

public interface ${name}Service {

	public ${name} create( ${name} ${name?lower_case});

	public ${name} delete(Long id) throws Exception;

	public List findAll();

	public ${name} update(${name} ${name?lower_case}) throws Exception;

	public ${name} findById(Long id);

}
