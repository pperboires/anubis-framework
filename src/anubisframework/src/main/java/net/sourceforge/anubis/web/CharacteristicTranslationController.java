package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.CharacteristicTranslation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "characteristictranslation", automaticallyMaintainView = true, formBackingObject = CharacteristicTranslation.class)
@RequestMapping("/characteristictranslation/**")
@Controller
public class CharacteristicTranslationController {
}
