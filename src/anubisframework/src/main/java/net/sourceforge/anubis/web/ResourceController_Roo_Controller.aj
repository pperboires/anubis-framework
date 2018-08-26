package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.Resource;
import net.sourceforge.anubis.domain.ResourceTranslation;
import net.sourceforge.anubis.domain.ResourceType;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ResourceController_Roo_Controller {
    
    @RequestMapping(value = "/resource", method = RequestMethod.POST)
    public String ResourceController.create(@Valid Resource resource, BindingResult result, ModelMap modelMap) {
        if (resource == null) throw new IllegalArgumentException("A resource is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("resource", resource);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("resources", Resource.findAllResources());
            modelMap.addAttribute("resourcetranslations", ResourceTranslation.findAllResourceTranslations());
            modelMap.addAttribute("resourcetypes", ResourceType.findAllResourceTypes());
            return "resource/create";
        }
        resource.persist();
        return "redirect:/resource/" + resource.getUid();
    }
    
    @RequestMapping(value = "/resource/form", method = RequestMethod.GET)
    public String ResourceController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("resource", new Resource());
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("resources", Resource.findAllResources());
        modelMap.addAttribute("resourcetranslations", ResourceTranslation.findAllResourceTranslations());
        modelMap.addAttribute("resourcetypes", ResourceType.findAllResourceTypes());
        return "resource/create";
    }
    
    @RequestMapping(value = "/resource/{uid}", method = RequestMethod.GET)
    public String ResourceController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("resource", Resource.findResource(uid));
        return "resource/show";
    }
    
    @RequestMapping(value = "/resource", method = RequestMethod.GET)
    public String ResourceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("resources", Resource.findResourceEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Resource.countResources() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("resources", Resource.findAllResources());
        }
        return "resource/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ResourceController.update(@Valid Resource resource, BindingResult result, ModelMap modelMap) {
        if (resource == null) throw new IllegalArgumentException("A resource is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("resource", resource);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("resources", Resource.findAllResources());
            modelMap.addAttribute("resourcetranslations", ResourceTranslation.findAllResourceTranslations());
            modelMap.addAttribute("resourcetypes", ResourceType.findAllResourceTypes());
            return "resource/update";
        }
        resource.merge();
        return "redirect:/resource/" + resource.getUid();
    }
    
    @RequestMapping(value = "/resource/{uid}/form", method = RequestMethod.GET)
    public String ResourceController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("resource", Resource.findResource(uid));
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("resources", Resource.findAllResources());
        modelMap.addAttribute("resourcetranslations", ResourceTranslation.findAllResourceTranslations());
        modelMap.addAttribute("resourcetypes", ResourceType.findAllResourceTypes());
        return "resource/update";
    }
    
    @RequestMapping(value = "/resource/{uid}", method = RequestMethod.DELETE)
    public String ResourceController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        Resource.findResource(uid).remove();
        return "redirect:/resource?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
