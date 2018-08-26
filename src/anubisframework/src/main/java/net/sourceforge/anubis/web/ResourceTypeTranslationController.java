package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.ResourceTypeTranslation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "resourcetypetranslation", automaticallyMaintainView = true, formBackingObject = ResourceTypeTranslation.class)
@RequestMapping("/resourcetypetranslation/**")
@Controller
public class ResourceTypeTranslationController {
}
