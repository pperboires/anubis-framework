package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.ContextValue;
import net.sourceforge.anubis.domain.ContextValueTranslation;
import net.sourceforge.anubis.domain.Locale;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ContextValueTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/contextvaluetranslation", method = RequestMethod.POST)
    public String ContextValueTranslationController.create(@Valid ContextValueTranslation contextValueTranslation, BindingResult result, ModelMap modelMap) {
        if (contextValueTranslation == null) throw new IllegalArgumentException("A contextValueTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("contextValueTranslation", contextValueTranslation);
            modelMap.addAttribute("contextvalues", ContextValue.findAllContextValues());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "contextvaluetranslation/create";
        }
        contextValueTranslation.persist();
        return "redirect:/contextvaluetranslation/" + contextValueTranslation.getUid();
    }
    
    @RequestMapping(value = "/contextvaluetranslation/form", method = RequestMethod.GET)
    public String ContextValueTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("contextValueTranslation", new ContextValueTranslation());
        modelMap.addAttribute("contextvalues", ContextValue.findAllContextValues());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "contextvaluetranslation/create";
    }
    
    @RequestMapping(value = "/contextvaluetranslation/{uid}", method = RequestMethod.GET)
    public String ContextValueTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("contextValueTranslation", ContextValueTranslation.findContextValueTranslation(uid));
        return "contextvaluetranslation/show";
    }
    
    @RequestMapping(value = "/contextvaluetranslation", method = RequestMethod.GET)
    public String ContextValueTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("contextvaluetranslations", ContextValueTranslation.findContextValueTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ContextValueTranslation.countContextValueTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("contextvaluetranslations", ContextValueTranslation.findAllContextValueTranslations());
        }
        return "contextvaluetranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ContextValueTranslationController.update(@Valid ContextValueTranslation contextValueTranslation, BindingResult result, ModelMap modelMap) {
        if (contextValueTranslation == null) throw new IllegalArgumentException("A contextValueTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("contextValueTranslation", contextValueTranslation);
            modelMap.addAttribute("contextvalues", ContextValue.findAllContextValues());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "contextvaluetranslation/update";
        }
        contextValueTranslation.merge();
        return "redirect:/contextvaluetranslation/" + contextValueTranslation.getUid();
    }
    
    @RequestMapping(value = "/contextvaluetranslation/{uid}/form", method = RequestMethod.GET)
    public String ContextValueTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("contextValueTranslation", ContextValueTranslation.findContextValueTranslation(uid));
        modelMap.addAttribute("contextvalues", ContextValue.findAllContextValues());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "contextvaluetranslation/update";
    }
    
    @RequestMapping(value = "/contextvaluetranslation/{uid}", method = RequestMethod.DELETE)
    public String ContextValueTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ContextValueTranslation.findContextValueTranslation(uid).remove();
        return "redirect:/contextvaluetranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
