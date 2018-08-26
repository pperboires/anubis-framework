package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Inactivation;
import net.sourceforge.anubis.domain.InactivationTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect InactivationTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/inactivationtranslation", method = RequestMethod.POST)
    public String InactivationTranslationController.create(@Valid InactivationTranslation inactivationTranslation, BindingResult result, ModelMap modelMap) {
        if (inactivationTranslation == null) throw new IllegalArgumentException("A inactivationTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("inactivationTranslation", inactivationTranslation);
            modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
            return "inactivationtranslation/create";
        }
        inactivationTranslation.persist();
        return "redirect:/inactivationtranslation/" + inactivationTranslation.getUid();
    }
    
    @RequestMapping(value = "/inactivationtranslation/form", method = RequestMethod.GET)
    public String InactivationTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("inactivationTranslation", new InactivationTranslation());
        modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
        return "inactivationtranslation/create";
    }
    
    @RequestMapping(value = "/inactivationtranslation/{uid}", method = RequestMethod.GET)
    public String InactivationTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("inactivationTranslation", InactivationTranslation.findInactivationTranslation(uid));
        return "inactivationtranslation/show";
    }
    
    @RequestMapping(value = "/inactivationtranslation", method = RequestMethod.GET)
    public String InactivationTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("inactivationtranslations", InactivationTranslation.findInactivationTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) InactivationTranslation.countInactivationTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("inactivationtranslations", InactivationTranslation.findAllInactivationTranslations());
        }
        return "inactivationtranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String InactivationTranslationController.update(@Valid InactivationTranslation inactivationTranslation, BindingResult result, ModelMap modelMap) {
        if (inactivationTranslation == null) throw new IllegalArgumentException("A inactivationTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("inactivationTranslation", inactivationTranslation);
            modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
            return "inactivationtranslation/update";
        }
        inactivationTranslation.merge();
        return "redirect:/inactivationtranslation/" + inactivationTranslation.getUid();
    }
    
    @RequestMapping(value = "/inactivationtranslation/{uid}/form", method = RequestMethod.GET)
    public String InactivationTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("inactivationTranslation", InactivationTranslation.findInactivationTranslation(uid));
        modelMap.addAttribute("inactivations", Inactivation.findAllInactivations());
        return "inactivationtranslation/update";
    }
    
    @RequestMapping(value = "/inactivationtranslation/{uid}", method = RequestMethod.DELETE)
    public String InactivationTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        InactivationTranslation.findInactivationTranslation(uid).remove();
        return "redirect:/inactivationtranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
