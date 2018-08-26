package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.AdministrativeRoleTranslation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "administrativeroletranslation", automaticallyMaintainView = true, formBackingObject = AdministrativeRoleTranslation.class)
@RequestMapping("/administrativeroletranslation/**")
@Controller
public class AdministrativeRoleTranslationController {
}
