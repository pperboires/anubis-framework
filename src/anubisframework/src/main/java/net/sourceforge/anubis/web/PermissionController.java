package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.Permission;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "permission", automaticallyMaintainView = true, formBackingObject = Permission.class)
@RequestMapping("/permission/**")
@Controller
public class PermissionController {
}
