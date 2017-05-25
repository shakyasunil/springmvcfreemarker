package com.dr.util;
import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

public class Generater {

	public static void main(String[] args) throws Exception {
		Generater gen = new Generater();
		
		if(args.length>0){
			gen.xmlToJava("template/"+args[0]);	
		}else{
		gen.xmlToJava("template/Sample.xml");
		}
	}

	public void xmlToJava(String xml) throws Exception {
		File fXmlFile = new File(xml);
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(fXmlFile);
		doc.getDocumentElement().normalize();
		NodeList modules = doc.getElementsByTagName("module");
		List modulesList = new ArrayList();
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File("."));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		
		for (int temp = 0; temp < modules.getLength(); temp++) {
			Node module = modules.item(temp);
			if (module.getNodeType() == Node.ELEMENT_NODE) {
				Element eElement = (Element) module;
				NodeList parameters = eElement.getElementsByTagName("Parameter");
				Map<String, Object> map = new HashMap<String, Object>();
				Module modul = new Module();
				modul.setName(eElement.getAttribute("Name"));
				modul.setPackageName(eElement.getAttribute("Package"));
				List parList = new ArrayList();
				for (int i = 0; i < parameters.getLength(); i++) {
					Node parameter = parameters.item(i);
					if (parameter.getNodeType() == Node.ELEMENT_NODE) {
						Element eParameter = (Element) parameter;
						Parameters par = new Parameters(eParameter.getAttribute("Name"),
								eParameter.getAttribute("Type"));
						parList.add(par);
					}
				}
				modul.setParameters(parList);

				Template moduletemplate = cfg.getTemplate("template/module-template.ftl");
				// Write module
				Writer file = new FileWriter(new File("src/main/java/" + modul.getPackageName().replace(".", "/")
						+ "/model/" + modul.getName() + ".java"));
				moduletemplate.process(modul, file);
				file.flush();
				file.close();

				// Write service

				Template serviceTemplate = cfg.getTemplate("template/serviceI-template.ftl");
				Writer service = new FileWriter(new File("src/main/java/" + modul.getPackageName().replace(".", "/")
						+ "/services/" + modul.getName() + "Service.java"));
				serviceTemplate.process(modul, service);
				service.flush();
				service.close();

				// Write serviceImp

				Template serviceTemplateimp = cfg.getTemplate("template/serviceImp-template.ftl");
				Writer serviceImp = new FileWriter(new File("src/main/java/" + modul.getPackageName().replace(".", "/")
						+ "/services/" + modul.getName() + "ServiceImp.java"));
				serviceTemplateimp.process(modul, serviceImp);
				serviceImp.flush();
				serviceImp.close();

				// Write repository
				Template repositoryTemplate = cfg.getTemplate("template/repository-template.ftl");
				Writer repository = new FileWriter(new File("src/main/java/" + modul.getPackageName().replace(".", "/")
						+ "/repository/" + modul.getName() + "Repository.java"));
				repositoryTemplate.process(modul, repository);
				repository.flush();
				repository.close();

				// Write controller
				Template controllerTemplate = cfg.getTemplate("template/controller-template.ftl");
				Writer controller = new FileWriter(new File("src/main/java/" + modul.getPackageName().replace(".", "/")
						+ "/controller/" + modul.getName() + "Controller.java"));
				controllerTemplate.process(modul, controller);
				controller.flush();
				controller.close();

				// Write add
				Template addTemplate = cfg.getTemplate("template/add-template.ftl");
				Writer add = new FileWriter(
						new File("src/main/webapp/WEB-INF/views/" + modul.getName().toLowerCase() + "-new.jsp"));
				addTemplate.process(modul, add);
				add.flush();
				add.close();

				Template updateTemplate = cfg.getTemplate("template/update-template.ftl");
				Writer update = new FileWriter(
						new File("src/main/webapp/WEB-INF/views/" + modul.getName().toLowerCase() + "-edit.jsp"));
				updateTemplate.process(modul, update);
				update.flush();
				update.close();

				Template listTemplate = cfg.getTemplate("template/list-template.ftl");
				Writer list = new FileWriter(
						new File("src/main/webapp/WEB-INF/views/" + modul.getName().toLowerCase() + "-list.jsp"));
				listTemplate.process(modul, list);
				list.flush();
				list.close();
				modulesList.add(modul);
			}
		}
		
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("modules", modulesList);
		Template listTemplate = cfg.getTemplate("template/welcome-template.ftl");
		Writer list = new FileWriter(new File("src/main/webapp/WEB-INF/views/welcome.jsp"));
		listTemplate.process(root, list);
		list.flush();
		list.close();

	}
}
