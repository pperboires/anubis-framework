package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.UserAccount;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "useraccount", automaticallyMaintainView = true, formBackingObject = UserAccount.class)
@RequestMapping("/useraccount/**")
@Controller
public class UserAccountController {
}
