package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.PermissionConflict;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "permissionconflict", automaticallyMaintainView = true, formBackingObject = PermissionConflict.class)
@RequestMapping("/permissionconflict/**")
@Controller
public class PermissionConflictController {
}
