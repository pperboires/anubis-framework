package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.UserAssignedCommonRole;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "userassignedcommonrole", automaticallyMaintainView = true, formBackingObject = UserAssignedCommonRole.class)
@RequestMapping("/userassignedcommonrole/**")
@Controller
public class UserAssignedCommonRoleController {
}
