package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Context;
import net.sourceforge.anubis.domain.ContextTranslation;
import net.sourceforge.anubis.domain.Locale;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ContextTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/contexttranslation", method = RequestMethod.POST)
    public String ContextTranslationController.create(@Valid ContextTranslation contextTranslation, BindingResult result, ModelMap modelMap) {
        if (contextTranslation == null) throw new IllegalArgumentException("A contextTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("contextTranslation", contextTranslation);
            modelMap.addAttribute("contexts", Context.findAllContexts());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "contexttranslation/create";
        }
        contextTranslation.persist();
        return "redirect:/contexttranslation/" + contextTranslation.getUid();
    }
    
    @RequestMapping(value = "/contexttranslation/form", method = RequestMethod.GET)
    public String ContextTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("contextTranslation", new ContextTranslation());
        modelMap.addAttribute("contexts", Context.findAllContexts());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "contexttranslation/create";
    }
    
    @RequestMapping(value = "/contexttranslation/{uid}", method = RequestMethod.GET)
    public String ContextTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("contextTranslation", ContextTranslation.findContextTranslation(uid));
        return "contexttranslation/show";
    }
    
    @RequestMapping(value = "/contexttranslation", method = RequestMethod.GET)
    public String ContextTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("contexttranslations", ContextTranslation.findContextTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ContextTranslation.countContextTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("contexttranslations", ContextTranslation.findAllContextTranslations());
        }
        return "contexttranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ContextTranslationController.update(@Valid ContextTranslation contextTranslation, BindingResult result, ModelMap modelMap) {
        if (contextTranslation == null) throw new IllegalArgumentException("A contextTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("contextTranslation", contextTranslation);
            modelMap.addAttribute("contexts", Context.findAllContexts());
            modelMap.addAttribute("locales", Locale.findAllLocales());
            return "contexttranslation/update";
        }
        contextTranslation.merge();
        return "redirect:/contexttranslation/" + contextTranslation.getUid();
    }
    
    @RequestMapping(value = "/contexttranslation/{uid}/form", method = RequestMethod.GET)
    public String ContextTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("contextTranslation", ContextTranslation.findContextTranslation(uid));
        modelMap.addAttribute("contexts", Context.findAllContexts());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        return "contexttranslation/update";
    }
    
    @RequestMapping(value = "/contexttranslation/{uid}", method = RequestMethod.DELETE)
    public String ContextTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ContextTranslation.findContextTranslation(uid).remove();
        return "redirect:/contexttranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
