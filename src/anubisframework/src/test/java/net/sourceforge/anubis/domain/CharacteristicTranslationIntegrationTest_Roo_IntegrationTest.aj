package net.sourceforge.anubis.domain;

import net.sourceforge.anubis.domain.CharacteristicTranslationDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CharacteristicTranslationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CharacteristicTranslationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CharacteristicTranslationIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    @Autowired
    private CharacteristicTranslationDataOnDemand CharacteristicTranslationIntegrationTest.dod;
    
    @Test
    public void CharacteristicTranslationIntegrationTest.testCountCharacteristicTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to initialize correctly", dod.getRandomCharacteristicTranslation());
        long count = net.sourceforge.anubis.domain.CharacteristicTranslation.countCharacteristicTranslations();
        org.junit.Assert.assertTrue("Counter for 'CharacteristicTranslation' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CharacteristicTranslationIntegrationTest.testFindCharacteristicTranslation() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to initialize correctly", dod.getRandomCharacteristicTranslation());
        java.lang.Long id = dod.getRandomCharacteristicTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicTranslation obj = net.sourceforge.anubis.domain.CharacteristicTranslation.findCharacteristicTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicTranslation' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'CharacteristicTranslation' returned the incorrect identifier", id, obj.getUid());
    }
    
    @Test
    public void CharacteristicTranslationIntegrationTest.testFindAllCharacteristicTranslations() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to initialize correctly", dod.getRandomCharacteristicTranslation());
        long count = net.sourceforge.anubis.domain.CharacteristicTranslation.countCharacteristicTranslations();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'CharacteristicTranslation', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<net.sourceforge.anubis.domain.CharacteristicTranslation> result = net.sourceforge.anubis.domain.CharacteristicTranslation.findAllCharacteristicTranslations();
        org.junit.Assert.assertNotNull("Find all method for 'CharacteristicTranslation' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'CharacteristicTranslation' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CharacteristicTranslationIntegrationTest.testFindCharacteristicTranslationEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to initialize correctly", dod.getRandomCharacteristicTranslation());
        long count = net.sourceforge.anubis.domain.CharacteristicTranslation.countCharacteristicTranslations();
        if (count > 20) count = 20;
        java.util.List<net.sourceforge.anubis.domain.CharacteristicTranslation> result = net.sourceforge.anubis.domain.CharacteristicTranslation.findCharacteristicTranslationEntries(0, (int)count);
        org.junit.Assert.assertNotNull("Find entries method for 'CharacteristicTranslation' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'CharacteristicTranslation' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    @Transactional
    public void CharacteristicTranslationIntegrationTest.testFlush() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to initialize correctly", dod.getRandomCharacteristicTranslation());
        java.lang.Long id = dod.getRandomCharacteristicTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicTranslation obj = net.sourceforge.anubis.domain.CharacteristicTranslation.findCharacteristicTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacteristicTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacteristicTranslation' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacteristicTranslationIntegrationTest.testMerge() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to initialize correctly", dod.getRandomCharacteristicTranslation());
        java.lang.Long id = dod.getRandomCharacteristicTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicTranslation obj = net.sourceforge.anubis.domain.CharacteristicTranslation.findCharacteristicTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicTranslation' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCharacteristicTranslation(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'CharacteristicTranslation' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);
    }
    
    @Test
    @Transactional
    public void CharacteristicTranslationIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to initialize correctly", dod.getRandomCharacteristicTranslation());
        net.sourceforge.anubis.domain.CharacteristicTranslation obj = dod.getNewTransientCharacteristicTranslation(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'CharacteristicTranslation' identifier to be null", obj.getUid());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'CharacteristicTranslation' identifier to no longer be null", obj.getUid());
    }
    
    @Test
    @Transactional
    public void CharacteristicTranslationIntegrationTest.testRemove() {
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to initialize correctly", dod.getRandomCharacteristicTranslation());
        java.lang.Long id = dod.getRandomCharacteristicTranslation().getUid();
        org.junit.Assert.assertNotNull("Data on demand for 'CharacteristicTranslation' failed to provide an identifier", id);
        net.sourceforge.anubis.domain.CharacteristicTranslation obj = net.sourceforge.anubis.domain.CharacteristicTranslation.findCharacteristicTranslation(id);
        org.junit.Assert.assertNotNull("Find method for 'CharacteristicTranslation' illegally returned null for id '" + id + "'", obj);
        obj.remove();
        org.junit.Assert.assertNull("Failed to remove 'CharacteristicTranslation' with identifier '" + id + "'", net.sourceforge.anubis.domain.CharacteristicTranslation.findCharacteristicTranslation(id));
    }
    
}
