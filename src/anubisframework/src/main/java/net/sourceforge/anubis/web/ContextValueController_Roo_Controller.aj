package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Context;
import net.sourceforge.anubis.domain.ContextValue;
import net.sourceforge.anubis.domain.ContextValueTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ContextValueController_Roo_Controller {
    
    @RequestMapping(value = "/contextvalue", method = RequestMethod.POST)
    public String ContextValueController.create(@Valid ContextValue contextValue, BindingResult result, ModelMap modelMap) {
        if (contextValue == null) throw new IllegalArgumentException("A contextValue is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("contextValue", contextValue);
            modelMap.addAttribute("contexts", Context.findAllContexts());
            modelMap.addAttribute("contextvaluetranslations", ContextValueTranslation.findAllContextValueTranslations());
            return "contextvalue/create";
        }
        contextValue.persist();
        return "redirect:/contextvalue/" + contextValue.getUid();
    }
    
    @RequestMapping(value = "/contextvalue/form", method = RequestMethod.GET)
    public String ContextValueController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("contextValue", new ContextValue());
        modelMap.addAttribute("contexts", Context.findAllContexts());
        modelMap.addAttribute("contextvaluetranslations", ContextValueTranslation.findAllContextValueTranslations());
        return "contextvalue/create";
    }
    
    @RequestMapping(value = "/contextvalue/{uid}", method = RequestMethod.GET)
    public String ContextValueController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("contextValue", ContextValue.findContextValue(uid));
        return "contextvalue/show";
    }
    
    @RequestMapping(value = "/contextvalue", method = RequestMethod.GET)
    public String ContextValueController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("contextvalues", ContextValue.findContextValueEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ContextValue.countContextValues() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("contextvalues", ContextValue.findAllContextValues());
        }
        return "contextvalue/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ContextValueController.update(@Valid ContextValue contextValue, BindingResult result, ModelMap modelMap) {
        if (contextValue == null) throw new IllegalArgumentException("A contextValue is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("contextValue", contextValue);
            modelMap.addAttribute("contexts", Context.findAllContexts());
            modelMap.addAttribute("contextvaluetranslations", ContextValueTranslation.findAllContextValueTranslations());
            return "contextvalue/update";
        }
        contextValue.merge();
        return "redirect:/contextvalue/" + contextValue.getUid();
    }
    
    @RequestMapping(value = "/contextvalue/{uid}/form", method = RequestMethod.GET)
    public String ContextValueController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("contextValue", ContextValue.findContextValue(uid));
        modelMap.addAttribute("contexts", Context.findAllContexts());
        modelMap.addAttribute("contextvaluetranslations", ContextValueTranslation.findAllContextValueTranslations());
        return "contextvalue/update";
    }
    
    @RequestMapping(value = "/contextvalue/{uid}", method = RequestMethod.DELETE)
    public String ContextValueController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        ContextValue.findContextValue(uid).remove();
        return "redirect:/contextvalue?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
