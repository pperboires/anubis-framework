package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.PermissionContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "permissioncontext", automaticallyMaintainView = true, formBackingObject = PermissionContext.class)
@RequestMapping("/permissioncontext/**")
@Controller
public class PermissionContextController {
}
