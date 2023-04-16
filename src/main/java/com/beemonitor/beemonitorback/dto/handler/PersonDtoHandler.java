package com.beemonitor.beemonitorback.dto.handler;

import com.beemonitor.beemonitorback.dto.in.PersonDtoIn;
import com.beemonitor.beemonitorback.dto.out.PersonDtoOut;
import com.beemonitor.beemonitorback.model.PersonEntity;

import java.util.ArrayList;
import java.util.List;

public class PersonDtoHandler extends AbstractDtoHandler{

    public static PersonDtoOut dtoFromEntity(PersonEntity personEntity) {
        if (personEntity == null) {
            return null;
        } else {
            var result = new PersonDtoOut();
            result.setId(personEntity.getId());
            result.setFirstName(personEntity.getFirstName());
            result.setLastName(personEntity.getLastName());
            result.setEmail(personEntity.getEmail());
            result.setPhone(personEntity.getPhone());
            result.setAdress(personEntity.getAdress());
            result.setIsAdmin(personEntity.isAdmin());
            result.setIsActive(personEntity.isActive());

            if (personEntity.getApiaries() == null) {
                result.setApiariesId(null);
            } else {
                List<Integer> apiariesId = new ArrayList<>();
                //  for(Apiary apiary : person.getApiaries()) {
                //     apiariesId.add(apiary.getId());
                // }
                personEntity.getApiaries()
                        .forEach(e -> apiariesId.add(e.getId()));
                result.setApiariesId(apiariesId);

            }

            return result;
        }
    }

    public static List<PersonDtoOut> dtoListFromEntity(List<PersonEntity> personEntityList) {

        if (personEntityList == null || personEntityList.isEmpty()) {
            return null;
        }
        var result = new ArrayList<PersonDtoOut>();
        personEntityList.forEach(e -> result.add(dtoFromEntity(e)));
        return result;

    }

    // TODO gérer la validation des données : regex email
    // Point d'entrée des données
    public static PersonEntity entityFromDTO(PersonDtoIn pDTO) {
        if (pDTO == null) {
            return null;
        } else {
            var result = new PersonEntity();
            result.setFirstName(checkAndClean(pDTO.getFirstName()));
            result.setLastName(checkAndClean(pDTO.getLastName()));
            result.setEmail(checkAndClean(pDTO.getEmail()));
            result.setPwd(checkAndClean(pDTO.getPwd()));
            result.setAdress(checkAndClean(pDTO.getAdress()));
            result.setPhone(checkAndClean(pDTO.getPhone()));
            result.setAdmin(false);
            result.setActive(true);

            return result;
        }
    }

}
