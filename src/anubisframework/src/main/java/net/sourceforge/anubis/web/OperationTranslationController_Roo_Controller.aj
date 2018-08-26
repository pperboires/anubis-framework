package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Locale;
import net.sourceforge.anubis.domain.Operation;
import net.sourceforge.anubis.domain.OperationTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect OperationTranslationController_Roo_Controller {
    
    @RequestMapping(value = "/operationtranslation", method = RequestMethod.POST)
    public String OperationTranslationController.create(@Valid OperationTranslation operationTranslation, BindingResult result, ModelMap modelMap) {
        if (operationTranslation == null) throw new IllegalArgumentException("A operationTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("operationTranslation", operationTranslation);
            modelMap.addAttribute("locales", Locale.findAllLocales());
            modelMap.addAttribute("operations", Operation.findAllOperations());
            return "operationtranslation/create";
        }
        operationTranslation.persist();
        return "redirect:/operationtranslation/" + operationTranslation.getUid();
    }
    
    @RequestMapping(value = "/operationtranslation/form", method = RequestMethod.GET)
    public String OperationTranslationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("operationTranslation", new OperationTranslation());
        modelMap.addAttribute("locales", Locale.findAllLocales());
        modelMap.addAttribute("operations", Operation.findAllOperations());
        return "operationtranslation/create";
    }
    
    @RequestMapping(value = "/operationtranslation/{uid}", method = RequestMethod.GET)
    public String OperationTranslationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("operationTranslation", OperationTranslation.findOperationTranslation(uid));
        return "operationtranslation/show";
    }
    
    @RequestMapping(value = "/operationtranslation", method = RequestMethod.GET)
    public String OperationTranslationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("operationtranslations", OperationTranslation.findOperationTranslationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) OperationTranslation.countOperationTranslations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("operationtranslations", OperationTranslation.findAllOperationTranslations());
        }
        return "operationtranslation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String OperationTranslationController.update(@Valid OperationTranslation operationTranslation, BindingResult result, ModelMap modelMap) {
        if (operationTranslation == null) throw new IllegalArgumentException("A operationTranslation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("operationTranslation", operationTranslation);
            modelMap.addAttribute("locales", Locale.findAllLocales());
            modelMap.addAttribute("operations", Operation.findAllOperations());
            return "operationtranslation/update";
        }
        operationTranslation.merge();
        return "redirect:/operationtranslation/" + operationTranslation.getUid();
    }
    
    @RequestMapping(value = "/operationtranslation/{uid}/form", method = RequestMethod.GET)
    public String OperationTranslationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("operationTranslation", OperationTranslation.findOperationTranslation(uid));
        modelMap.addAttribute("locales", Locale.findAllLocales());
        modelMap.addAttribute("operations", Operation.findAllOperations());
        return "operationtranslation/update";
    }
    
    @RequestMapping(value = "/operationtranslation/{uid}", method = RequestMethod.DELETE)
    public String OperationTranslationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        OperationTranslation.findOperationTranslation(uid).remove();
        return "redirect:/operationtranslation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
