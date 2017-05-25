package ${packageName}.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "${name?lower_case}")
public class ${name} extends BaseModel {
   private static final long serialVersionUID = 1L;
   @Id
   @GeneratedValue
   private Long id;
   public Long getId() {
		return id;
   }

   public void setId(Long id) {
		this.id = id;
   }   
   
<#list parameters as parameter>
   @Column
   private ${parameter.type} ${parameter.name};
</#list>


<#list parameters as parameter>
   public ${parameter.type} get${parameter.name?cap_first}() {
		return ${parameter.name};
   }

   public void set${parameter.name?cap_first}(${parameter.type} ${parameter.name}) {
	 this.${parameter.name} = ${parameter.name};
   }
</#list>




}