package com.beemonitor.beemonitorback.dto.handler;

import com.beemonitor.beemonitorback.dto.out.PersonDtoOut;
import com.beemonitor.beemonitorback.model.Apiary;
import com.beemonitor.beemonitorback.model.Person;

import java.util.ArrayList;
import java.util.List;

public class PersonDtoHandler {

    public static PersonDtoOut dtoFromEntity(Person person) {
        if (person == null) {
            return null;
        } else {
            var result = new PersonDtoOut();
            result.setId(person.getId());
            result.setFirstName(person.getFirstName());
            result.setLastName(person.getLastName());
            result.setEmail(person.getEmail());
            result.setPhone(person.getPhone());
            result.setAdress(person.getAdress());
            result.setIsAdmin(person.getIsAdmin());
            result.setIsActive(person.getIsActive());

            if (person.getApiaries() == null) {
                result.setApiariesId(null);
            } else {
                List<Long> apiariesId = new ArrayList<>();
                //  for(Apiary apiary : person.getApiaries()) {
                //     apiariesId.add(apiary.getId());
                // }
                person.getApiaries()
                        .forEach(e -> apiariesId.add(e.getId()));
                result.setApiariesId(apiariesId);

            }

            return result;
        }
    }

    public static List<PersonDtoOut> dtoListFromEntity(List<Person> personList) {

        if (personList == null || personList.isEmpty()) {
            return null;
        }
        var result = new ArrayList<PersonDtoOut>();
        personList.forEach(e -> result.add(dtoFromEntity(e)));
        return result;

    }

}
