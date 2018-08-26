package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.PermissionConflictTranslation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "permissionconflicttranslation", automaticallyMaintainView = true, formBackingObject = PermissionConflictTranslation.class)
@RequestMapping("/permissionconflicttranslation/**")
@Controller
public class PermissionConflictTranslationController {
}
