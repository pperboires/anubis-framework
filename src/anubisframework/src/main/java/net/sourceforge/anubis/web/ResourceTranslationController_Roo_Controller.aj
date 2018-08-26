package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Locale;
import net.sourceforge.anubis.domain.Resource;
import net.sourceforge.anubis.domain.ResourceTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ResourceTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/resourcetranslation", method = RequestMethod.POST)
    public String ResourceTranslationController.create(@Valid ResourceTranslation resourceTranslation, BindingResult result, ModelMap modelMap) {
        if (resourceTranslation == null) throw new IllegalArgumentException("A resourceTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("resourceTranslation", resourceTranslation);
            modelMap.addAttribute("locales", Locale.findAllLocales());
            modelMap.addAttribute("resources", Resource.findAllResources());
            return "resourcetranslation/create";
        }
        resourceTranslation.persist();
        return "redirect:/resourcetranslation/" + resourceTranslation.getUid();
    }
    
    @RequestMapping(value = "/resourcetranslation/form", method = RequestMethod.GET)
    public String ResourceTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("resourceTranslation", new ResourceTranslation());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        modelMap.addAttribute("resources", Resource.findAllResources());
        return "resourcetranslation/create";
    }
    
    @RequestMapping(value = "/resourcetranslation/{uid}", method = RequestMethod.GET)
    public String ResourceTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("resourceTranslation", ResourceTranslation.findResourceTranslation(uid));
        return "resourcetranslation/show";
    }
    
    @RequestMapping(value = "/resourcetranslation", method = RequestMethod.GET)
    public String ResourceTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("resourcetranslations", ResourceTranslation.findResourceTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ResourceTranslation.countResourceTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("resourcetranslations", ResourceTranslation.findAllResourceTranslations());
        }
        return "resourcetranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ResourceTranslationController.update(@Valid ResourceTranslation resourceTranslation, BindingResult result, ModelMap modelMap) {
        if (resourceTranslation == null) throw new IllegalArgumentException("A resourceTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("resourceTranslation", resourceTranslation);
            modelMap.addAttribute("locales", Locale.findAllLocales());
            modelMap.addAttribute("resources", Resource.findAllResources());
            return "resourcetranslation/update";
        }
        resourceTranslation.merge();
        return "redirect:/resourcetranslation/" + resourceTranslation.getUid();
    }
    
    @RequestMapping(value = "/resourcetranslation/{uid}/form", method = RequestMethod.GET)
    public String ResourceTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("resourceTranslation", ResourceTranslation.findResourceTranslation(uid));
        modelMap.addAttribute("locales", Locale.findAllLocales());
        modelMap.addAttribute("resources", Resource.findAllResources());
        return "resourcetranslation/update";
    }
    
    @RequestMapping(value = "/resourcetranslation/{uid}", method = RequestMethod.DELETE)
    public String ResourceTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ResourceTranslation.findResourceTranslation(uid).remove();
        return "redirect:/resourcetranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
