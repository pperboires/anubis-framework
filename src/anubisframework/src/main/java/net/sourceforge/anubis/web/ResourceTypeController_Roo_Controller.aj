package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.ResourceType;
import net.sourceforge.anubis.domain.ResourceTypeTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ResourceTypeController_Roo_Controller {
    
    @RequestMapping(value = "/resourcetype", method = RequestMethod.POST)
    public String ResourceTypeController.create(@Valid ResourceType resourceType, BindingResult result, ModelMap modelMap) {
        if (resourceType == null) throw new IllegalArgumentException("A resourceType is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("resourceType", resourceType);
            modelMap.addAttribute("resourcetypetranslations", ResourceTypeTranslation.findAllResourceTypeTranslations());
            return "resourcetype/create";
        }
        resourceType.persist();
        return "redirect:/resourcetype/" + resourceType.getUid();
    }
    
    @RequestMapping(value = "/resourcetype/form", method = RequestMethod.GET)
    public String ResourceTypeController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("resourceType", new ResourceType());
        modelMap.addAttribute("resourcetypetranslations", ResourceTypeTranslation.findAllResourceTypeTranslations());
        return "resourcetype/create";
    }
    
    @RequestMapping(value = "/resourcetype/{uid}", method = RequestMethod.GET)
    public String ResourceTypeController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("resourceType", ResourceType.findResourceType(uid));
        return "resourcetype/show";
    }
    
    @RequestMapping(value = "/resourcetype", method = RequestMethod.GET)
    public String ResourceTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("resourcetypes", ResourceType.findResourceTypeEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ResourceType.countResourceTypes() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("resourcetypes", ResourceType.findAllResourceTypes());
        }
        return "resourcetype/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ResourceTypeController.update(@Valid ResourceType resourceType, BindingResult result, ModelMap modelMap) {
        if (resourceType == null) throw new IllegalArgumentException("A resourceType is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("resourceType", resourceType);
            modelMap.addAttribute("resourcetypetranslations", ResourceTypeTranslation.findAllResourceTypeTranslations());
            return "resourcetype/update";
        }
        resourceType.merge();
        return "redirect:/resourcetype/" + resourceType.getUid();
    }
    
    @RequestMapping(value = "/resourcetype/{uid}/form", method = RequestMethod.GET)
    public String ResourceTypeController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("resourceType", ResourceType.findResourceType(uid));
        modelMap.addAttribute("resourcetypetranslations", ResourceTypeTranslation.findAllResourceTypeTranslations());
        return "resourcetype/update";
    }
    
    @RequestMapping(value = "/resourcetype/{uid}", method = RequestMethod.DELETE)
    public String ResourceTypeController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ResourceType.findResourceType(uid).remove();
        return "redirect:/resourcetype?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
