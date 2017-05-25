package ${packageName}.services;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ${packageName}.model.${name};
import ${packageName}.repository.${name}Repository;



@Service
@Transactional
public class ${name}ServiceImp implements ${name}Service {

	@Inject
	private ${name}Repository ${name?lower_case}Repository;

	@Transactional
	public ${name} create(${name} ${name?lower_case}) {
		${name} created${name} = ${name?lower_case};
		return ${name?lower_case}Repository.save(created${name});
	}

	@Transactional
	public ${name} findById(Long id) {
		return ${name?lower_case}Repository.findOne(id);
	}

	@Transactional(rollbackFor = Exception.class)
	public ${name} delete(Long id) throws Exception {
		${name} deleted${name} = ${name?lower_case}Repository.findOne(id);

		if (deleted${name} == null)
			throw new Exception();

		${name?lower_case}Repository.delete(deleted${name});
		return deleted${name};
	}

	@Transactional
	public List findAll() {
		return ${name?lower_case}Repository.findAll();
	}
	@Transactional(rollbackFor = Exception.class)
	public ${name} update(${name} ${name?lower_case}) throws Exception {
		${name} updated${name} = ${name?lower_case}Repository.findOne(${name?lower_case}.getId());
		if (updated${name} == null)
			throw new Exception();
	   <#list parameters as parameter>
        updated${name}.set${parameter.name?cap_first}(${name?lower_case}.get${parameter.name?cap_first}());
       </#list>
    	return updated${name};
	}
	public ${name}Repository get${name}Repository() {
		return ${name?lower_case}Repository;
	}

	public void set${name}Repository(${name}Repository ${name?lower_case}Repository) {
		this.${name?lower_case}Repository = ${name?lower_case}Repository;
	}
	
}
