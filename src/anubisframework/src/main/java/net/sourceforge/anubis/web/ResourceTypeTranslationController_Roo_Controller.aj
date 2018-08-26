package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Locale;
import net.sourceforge.anubis.domain.ResourceType;
import net.sourceforge.anubis.domain.ResourceTypeTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ResourceTypeTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/resourcetypetranslation", method = RequestMethod.POST)
    public String ResourceTypeTranslationController.create(@Valid ResourceTypeTranslation resourceTypeTranslation, BindingResult result, ModelMap modelMap) {
        if (resourceTypeTranslation == null) throw new IllegalArgumentException("A resourceTypeTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("resourceTypeTranslation", resourceTypeTranslation);
            modelMap.addAttribute("locales", Locale.findAllLocales());
            modelMap.addAttribute("resourcetypes", ResourceType.findAllResourceTypes());
            return "resourcetypetranslation/create";
        }
        resourceTypeTranslation.persist();
        return "redirect:/resourcetypetranslation/" + resourceTypeTranslation.getUid();
    }
    
    @RequestMapping(value = "/resourcetypetranslation/form", method = RequestMethod.GET)
    public String ResourceTypeTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("resourceTypeTranslation", new ResourceTypeTranslation());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        modelMap.addAttribute("resourcetypes", ResourceType.findAllResourceTypes());
        return "resourcetypetranslation/create";
    }
    
    @RequestMapping(value = "/resourcetypetranslation/{uid}", method = RequestMethod.GET)
    public String ResourceTypeTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("resourceTypeTranslation", ResourceTypeTranslation.findResourceTypeTranslation(uid));
        return "resourcetypetranslation/show";
    }
    
    @RequestMapping(value = "/resourcetypetranslation", method = RequestMethod.GET)
    public String ResourceTypeTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("resourcetypetranslations", ResourceTypeTranslation.findResourceTypeTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ResourceTypeTranslation.countResourceTypeTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("resourcetypetranslations", ResourceTypeTranslation.findAllResourceTypeTranslations());
        }
        return "resourcetypetranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ResourceTypeTranslationController.update(@Valid ResourceTypeTranslation resourceTypeTranslation, BindingResult result, ModelMap modelMap) {
        if (resourceTypeTranslation == null) throw new IllegalArgumentException("A resourceTypeTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("resourceTypeTranslation", resourceTypeTranslation);
            modelMap.addAttribute("locales", Locale.findAllLocales());
            modelMap.addAttribute("resourcetypes", ResourceType.findAllResourceTypes());
            return "resourcetypetranslation/update";
        }
        resourceTypeTranslation.merge();
        return "redirect:/resourcetypetranslation/" + resourceTypeTranslation.getUid();
    }
    
    @RequestMapping(value = "/resourcetypetranslation/{uid}/form", method = RequestMethod.GET)
    public String ResourceTypeTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("resourceTypeTranslation", ResourceTypeTranslation.findResourceTypeTranslation(uid));
        modelMap.addAttribute("locales", Locale.findAllLocales());
        modelMap.addAttribute("resourcetypes", ResourceType.findAllResourceTypes());
        return "resourcetypetranslation/update";
    }
    
    @RequestMapping(value = "/resourcetypetranslation/{uid}", method = RequestMethod.DELETE)
    public String ResourceTypeTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ResourceTypeTranslation.findResourceTypeTranslation(uid).remove();
        return "redirect:/resourcetypetranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
