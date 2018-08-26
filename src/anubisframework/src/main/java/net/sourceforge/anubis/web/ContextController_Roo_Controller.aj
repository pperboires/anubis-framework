package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.Context;
import net.sourceforge.anubis.domain.ContextTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ContextController_Roo_Controller {
    
    @RequestMapping(value = "/context", method = RequestMethod.POST)
    public String ContextController.create(@Valid Context context, BindingResult result, ModelMap modelMap) {
        if (context == null) throw new IllegalArgumentException("A context is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("context", context);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("contexttranslations", ContextTranslation.findAllContextTranslations());
            return "context/create";
        }
        context.persist();
        return "redirect:/context/" + context.getUid();
    }
    
    @RequestMapping(value = "/context/form", method = RequestMethod.GET)
    public String ContextController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("context", new Context());
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("contexttranslations", ContextTranslation.findAllContextTranslations());
        return "context/create";
    }
    
    @RequestMapping(value = "/context/{uid}", method = RequestMethod.GET)
    public String ContextController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("context", Context.findContext(uid));
        return "context/show";
    }
    
    @RequestMapping(value = "/context", method = RequestMethod.GET)
    public String ContextController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("contexts", Context.findContextEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Context.countContexts() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("contexts", Context.findAllContexts());
        }
        return "context/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ContextController.update(@Valid Context context, BindingResult result, ModelMap modelMap) {
        if (context == null) throw new IllegalArgumentException("A context is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("context", context);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("contexttranslations", ContextTranslation.findAllContextTranslations());
            return "context/update";
        }
        context.merge();
        return "redirect:/context/" + context.getUid();
    }
    
    @RequestMapping(value = "/context/{uid}/form", method = RequestMethod.GET)
    public String ContextController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("context", Context.findContext(uid));
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("contexttranslations", ContextTranslation.findAllContextTranslations());
        return "context/update";
    }
    
    @RequestMapping(value = "/context/{uid}", method = RequestMethod.DELETE)
    public String ContextController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        Context.findContext(uid).remove();
        return "redirect:/context?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
