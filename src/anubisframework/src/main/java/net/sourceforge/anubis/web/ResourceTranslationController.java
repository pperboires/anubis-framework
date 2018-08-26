package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.ResourceTranslation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "resourcetranslation", automaticallyMaintainView = true, formBackingObject = ResourceTranslation.class)
@RequestMapping("/resourcetranslation/**")
@Controller
public class ResourceTranslationController {
}
