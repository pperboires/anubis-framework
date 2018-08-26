package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.ManualGroup;
import net.sourceforge.anubis.domain.ManualGroupTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ManualGroupController_Roo_Controller {
    
    @RequestMapping(value = "/manualgroup", method = RequestMethod.POST)
    public String ManualGroupController.create(@Valid ManualGroup manualGroup, BindingResult result, ModelMap modelMap) {
        if (manualGroup == null) throw new IllegalArgumentException("A manualGroup is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("manualGroup", manualGroup);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("manualgrouptranslations", ManualGroupTranslation.findAllManualGroupTranslations());
            return "manualgroup/create";
        }
        manualGroup.persist();
        return "redirect:/manualgroup/" + manualGroup.getUid();
    }
    
    @RequestMapping(value = "/manualgroup/form", method = RequestMethod.GET)
    public String ManualGroupController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("manualGroup", new ManualGroup());
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("manualgrouptranslations", ManualGroupTranslation.findAllManualGroupTranslations());
        return "manualgroup/create";
    }
    
    @RequestMapping(value = "/manualgroup/{uid}", method = RequestMethod.GET)
    public String ManualGroupController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("manualGroup", ManualGroup.findManualGroup(uid));
        return "manualgroup/show";
    }
    
    @RequestMapping(value = "/manualgroup", method = RequestMethod.GET)
    public String ManualGroupController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("manualgroups", ManualGroup.findManualGroupEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ManualGroup.countManualGroups() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
        }
        return "manualgroup/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ManualGroupController.update(@Valid ManualGroup manualGroup, BindingResult result, ModelMap modelMap) {
        if (manualGroup == null) throw new IllegalArgumentException("A manualGroup is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("manualGroup", manualGroup);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("manualgrouptranslations", ManualGroupTranslation.findAllManualGroupTranslations());
            return "manualgroup/update";
        }
        manualGroup.merge();
        return "redirect:/manualgroup/" + manualGroup.getUid();
    }
    
    @RequestMapping(value = "/manualgroup/{uid}/form", method = RequestMethod.GET)
    public String ManualGroupController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("manualGroup", ManualGroup.findManualGroup(uid));
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("manualgrouptranslations", ManualGroupTranslation.findAllManualGroupTranslations());
        return "manualgroup/update";
    }
    
    @RequestMapping(value = "/manualgroup/{uid}", method = RequestMethod.DELETE)
    public String ManualGroupController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ManualGroup.findManualGroup(uid).remove();
        return "redirect:/manualgroup?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
