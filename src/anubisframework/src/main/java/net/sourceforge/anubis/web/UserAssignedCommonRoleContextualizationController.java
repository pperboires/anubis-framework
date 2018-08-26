package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.UserAssignedCommonRoleContextualization;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "userassignedcommonrolecontextualization", automaticallyMaintainView = true, formBackingObject = UserAssignedCommonRoleContextualization.class)
@RequestMapping("/userassignedcommonrolecontextualization/**")
@Controller
public class UserAssignedCommonRoleContextualizationController {
}
