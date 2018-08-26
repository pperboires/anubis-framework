package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.CommonRoleAssignedPermission;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "commonroleassignedpermission", automaticallyMaintainView = true, formBackingObject = CommonRoleAssignedPermission.class)
@RequestMapping("/commonroleassignedpermission/**")
@Controller
public class CommonRoleAssignedPermissionController {
}
