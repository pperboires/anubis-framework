package net.sourceforge.anubis.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import net.sourceforge.anubis.domain.Application;
import net.sourceforge.anubis.domain.Operation;
import net.sourceforge.anubis.domain.OperationTranslation;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect OperationController_Roo_Controller {
    
    @RequestMapping(value = "/operation", method = RequestMethod.POST)
    public String OperationController.create(@Valid Operation operation, BindingResult result, ModelMap modelMap) {
        if (operation == null) throw new IllegalArgumentException("A operation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("operation", operation);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("operationtranslations", OperationTranslation.findAllOperationTranslations());
            return "operation/create";
        }
        operation.persist();
        return "redirect:/operation/" + operation.getUid();
    }
    
    @RequestMapping(value = "/operation/form", method = RequestMethod.GET)
    public String OperationController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("operation", new Operation());
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("operationtranslations", OperationTranslation.findAllOperationTranslations());
        return "operation/create";
    }
    
    @RequestMapping(value = "/operation/{uid}", method = RequestMethod.GET)
    public String OperationController.show(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("operation", Operation.findOperation(uid));
        return "operation/show";
    }
    
    @RequestMapping(value = "/operation", method = RequestMethod.GET)
    public String OperationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("operations", Operation.findOperationEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Operation.countOperations() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("operations", Operation.findAllOperations());
        }
        return "operation/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String OperationController.update(@Valid Operation operation, BindingResult result, ModelMap modelMap) {
        if (operation == null) throw new IllegalArgumentException("A operation is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("operation", operation);
            modelMap.addAttribute("applications", Application.findAllApplications());
            modelMap.addAttribute("operationtranslations", OperationTranslation.findAllOperationTranslations());
            return "operation/update";
        }
        operation.merge();
        return "redirect:/operation/" + operation.getUid();
    }
    
    @RequestMapping(value = "/operation/{uid}/form", method = RequestMethod.GET)
    public String OperationController.updateForm(@PathVariable("uid") Long uid, ModelMap modelMap) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("operation", Operation.findOperation(uid));
        modelMap.addAttribute("applications", Application.findAllApplications());
        modelMap.addAttribute("operationtranslations", OperationTranslation.findAllOperationTranslations());
        return "operation/update";
    }
    
    @RequestMapping(value = "/operation/{uid}", method = RequestMethod.DELETE)
    public String OperationController.delete(@PathVariable("uid") Long uid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (uid == null) throw new IllegalArgumentException("An Identifier is required");
        Operation.findOperation(uid).remove();
        return "redirect:/operation?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
