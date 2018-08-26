package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Inactivation;
import net.sourceforge.anubis.domain.InactivationTranslation;
import net.sourceforge.anubis.domain.Validity;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect InactivationController_Roo_Controller {
    
    @RequestMapping(value = "/inactivation", method = RequestMethod.POST)
    public String InactivationController.create(@Valid Inactivation inactivation, BindingResult result, ModelMap modelMap) {
        if (inactivation == null) throw new IllegalArgumentException("A inactivation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("inactivation", inactivation);
            modelMap.addAttribute("inactivationtranslations", InactivationTranslation.findAllInactivationTranslations());
            modelMap.addAttribute("validitys", Validity.findAllValiditys());
            return "inactivation/create";
        }
        inactivation.persist();
        return "redirect:/inactivation/" + inactivation.getUid();
    }
    
    @RequestMapping(value = "/inactivation/form", method = RequestMethod.GET)
    public String InactivationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("inactivation", new Inactivation());
        modelMap.addAttribute("inactivationtranslations", InactivationTranslation.findAllInactivationTranslations());
        modelMap.addAttribute("validitys", Validity.findAllValiditys());
        return "inactivation/create";
    }
    
    @RequestMapping(value = "/inactivation/{uid}", method = RequestMethod.GET)
    public String InactivationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("inactivation", Inactivation.findInactivation(uid));
        return "inactivation/show";
    }
    
    @RequestMapping(value = "/inactivation", method = RequestMethod.GET)
    public String InactivationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("inactivations", Inactivation.findInactivationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Inactivation.countInactivations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
        }
        return "inactivation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String InactivationController.update(@Valid Inactivation inactivation, BindingResult result, ModelMap modelMap) {
        if (inactivation == null) throw new IllegalArgumentException("A inactivation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("inactivation", inactivation);
            modelMap.addAttribute("inactivationtranslations", InactivationTranslation.findAllInactivationTranslations());
            modelMap.addAttribute("validitys", Validity.findAllValiditys());
            return "inactivation/update";
        }
        inactivation.merge();
        return "redirect:/inactivation/" + inactivation.getUid();
    }
    
    @RequestMapping(value = "/inactivation/{uid}/form", method = RequestMethod.GET)
    public String InactivationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("inactivation", Inactivation.findInactivation(uid));
        modelMap.addAttribute("inactivationtranslations", InactivationTranslation.findAllInactivationTranslations());
        modelMap.addAttribute("validitys", Validity.findAllValiditys());
        return "inactivation/update";
    }
    
    @RequestMapping(value = "/inactivation/{uid}", method = RequestMethod.DELETE)
    public String InactivationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        Inactivation.findInactivation(uid).remove();
        return "redirect:/inactivation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
