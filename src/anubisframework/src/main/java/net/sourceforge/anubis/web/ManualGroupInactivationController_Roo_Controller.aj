package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.ManualGroup;
import net.sourceforge.anubis.domain.ManualGroupInactivation;
import net.sourceforge.anubis.domain.Validity;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ManualGroupInactivationController_Roo_Controller {
    
    @RequestMapping(value = "/manualgroupinactivation", method = RequestMethod.POST)
    public String ManualGroupInactivationController.create(@Valid ManualGroupInactivation manualGroupInactivation, BindingResult result, ModelMap modelMap) {
        if (manualGroupInactivation == null) throw new IllegalArgumentException("A manualGroupInactivation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("manualGroupInactivation", manualGroupInactivation);
            modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
            modelMap.addAttribute("validitys", Validity.findAllValiditys());
            return "manualgroupinactivation/create";
        }
        manualGroupInactivation.persist();
        return "redirect:/manualgroupinactivation/" + manualGroupInactivation.getUid();
    }
    
    @RequestMapping(value = "/manualgroupinactivation/form", method = RequestMethod.GET)
    public String ManualGroupInactivationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("manualGroupInactivation", new ManualGroupInactivation());
        modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
        modelMap.addAttribute("validitys", Validity.findAllValiditys());
        return "manualgroupinactivation/create";
    }
    
    @RequestMapping(value = "/manualgroupinactivation/{uid}", method = RequestMethod.GET)
    public String ManualGroupInactivationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("manualGroupInactivation", ManualGroupInactivation.findManualGroupInactivation(uid));
        return "manualgroupinactivation/show";
    }
    
    @RequestMapping(value = "/manualgroupinactivation", method = RequestMethod.GET)
    public String ManualGroupInactivationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("manualgroupinactivations", ManualGroupInactivation.findManualGroupInactivationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ManualGroupInactivation.countManualGroupInactivations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("manualgroupinactivations", ManualGroupInactivation.findAllManualGroupInactivations());
        }
        return "manualgroupinactivation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ManualGroupInactivationController.update(@Valid ManualGroupInactivation manualGroupInactivation, BindingResult result, ModelMap modelMap) {
        if (manualGroupInactivation == null) throw new IllegalArgumentException("A manualGroupInactivation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("manualGroupInactivation", manualGroupInactivation);
            modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
            modelMap.addAttribute("validitys", Validity.findAllValiditys());
            return "manualgroupinactivation/update";
        }
        manualGroupInactivation.merge();
        return "redirect:/manualgroupinactivation/" + manualGroupInactivation.getUid();
    }
    
    @RequestMapping(value = "/manualgroupinactivation/{uid}/form", method = RequestMethod.GET)
    public String ManualGroupInactivationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("manualGroupInactivation", ManualGroupInactivation.findManualGroupInactivation(uid));
        modelMap.addAttribute("manualgroups", ManualGroup.findAllManualGroups());
        modelMap.addAttribute("validitys", Validity.findAllValiditys());
        return "manualgroupinactivation/update";
    }
    
    @RequestMapping(value = "/manualgroupinactivation/{uid}", method = RequestMethod.DELETE)
    public String ManualGroupInactivationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ManualGroupInactivation.findManualGroupInactivation(uid).remove();
        return "redirect:/manualgroupinactivation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
