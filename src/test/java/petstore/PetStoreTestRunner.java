package petstore;

import com.intuit.karate.junit5.Karate;

public class PetStoreTestRunner {
    @Karate.Test
    Karate runTests() {
        //return Karate.run("features/petstore.feature").relativeTo(getClass());
        return Karate.run("classpath:petstore/features/petstore.feature");
    }
}
