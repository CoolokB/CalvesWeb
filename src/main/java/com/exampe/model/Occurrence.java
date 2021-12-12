package com.exampe.model;

import com.exampe.model.sequences.CalvingSequence;
import com.exampe.model.sequences.MedicineInputSequence;
import com.exampe.enums.*;
import com.exampe.enums.death.DeathMethod;
import com.exampe.enums.death.DeathReason;
import com.exampe.enums.hoofCare.HoofCareMovement;
import com.exampe.enums.hoofCare.HoofCareShape;
import com.exampe.enums.hoofCare.HoofCareType;
import com.exampe.model.occurrence.HoofCareInfo;
import com.exampe.model.occurrence.MedicineInfo;
import com.exampe.model.sequences.HoofCareProblemAndTreatmentSequence;
import com.exampe.service.DateService;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Setter
@Getter
@Entity
public class Occurrence {

    @PostLoad
    private void Initial() {

        if (medicineInputSequenceList.size() > 0) {

            medicineInputSequenceList.forEach(m -> {

                Optional<Medicine> medicine = medicineList.stream().filter(med -> med.getId() == m.getMedicineId()).findAny();
                Optional<Person> person = personList.stream().filter(p -> p.getId() == m.getPersonId()).findAny();

                if (medicine.isPresent()) {

                    m.setMedicine(medicine.get());

                    if (medicine.get().getType().equals(MedicineType.NORMAL_WITHDRAWAL)) {

                        m.setUntilMilkDays(medicine.get().getWithdrawalMilkNormal());
                        m.setUntilSlaughterDays(medicine.get().getWithdrawalSlaughter());
                        m.setUntilMilk(DateService.calculateWithdrawal(medicine.get().getWithdrawalMilkNormal(), getDate()));
                        m.setUntilSlaughter(DateService.calculateWithdrawal(medicine.get().getWithdrawalSlaughter(), getDate()));

                    }

                }

                person.ifPresent(m::setPerson);

            });

        }
        if (hoofCareProblemAndTreatmentSequenceList.size() > 0) {

            hoofCareInfo = new ArrayList<>();

            hoofCareProblemAndTreatmentSequenceList.forEach(h -> {

                List<OccurrenceExtraInfo> problems = new ArrayList<>();
                List<OccurrenceExtraInfo> treatments = new ArrayList<>();

                String[] problemTempArray = h.getProblemId().split(",");
                String[] treatmentTempArray = h.getTreatmentId().split(",");

                List<Integer> problemTempList = Arrays.stream(problemTempArray).
                        map(Integer::parseInt).collect(Collectors.toList());

                List<Integer> treatmentTempList = Arrays.stream(treatmentTempArray).
                        map(Integer::parseInt).collect(Collectors.toList());

                for (Integer integer : problemTempList) {

                    for (OccurrenceExtraInfo occurrenceExtraInfo : OEIList) {

                        if (occurrenceExtraInfo.getId() == integer) {

                            problems.add(occurrenceExtraInfo);

                        }

                    }

                }

                for (Integer integer : treatmentTempList) {

                    for (OccurrenceExtraInfo occurrenceExtraInfo : OEIList) {

                        if (occurrenceExtraInfo.getId() == integer) {

                            treatments.add(occurrenceExtraInfo);

                        }

                    }

                }

                HoofCareInfo hi = new HoofCareInfo();

                hi.setHoof(h.getHoof());
                hi.setShape(h.getShape());
                hi.setProblem(problems);
                hi.setTreatment(treatments);

                hoofCareInfo.add(hi);

            });

        }

    }

    @Id
    @GeneratedValue
    protected int id;

    protected int age;

    private boolean hidden;

    private boolean fl;
    private boolean fr;
    private boolean rl;
    private boolean rr;

    @Enumerated(EnumType.STRING)
    private OccurrenceType occurrenceType;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;

    @ManyToMany(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            fetch = FetchType.LAZY)
    private List<OccurrenceExtraInfo> OEIList;

    @ManyToMany(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            fetch = FetchType.LAZY)
    private List<Medicine> medicineList;

    @ManyToMany(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            fetch = FetchType.LAZY)
    private List<Person> personList;

    @ManyToOne(fetch = FetchType.LAZY)
    private Calf calf;

    @ElementCollection
    private List<MedicineInputSequence> medicineInputSequenceList;

    @ElementCollection
    private List<HoofCareProblemAndTreatmentSequence> hoofCareProblemAndTreatmentSequenceList;

    //Calving
//    @OneToOne(mappedBy = "calving")
//    private Occurrence insemination;
//
//    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
//            fetch = FetchType.LAZY)
//    private Occurrence calving;
//
//

    @OneToOne
    private Occurrence insemination;

    @OneToOne(cascade = CascadeType.PERSIST)
    private Occurrence calving;

    @OneToOne
    private Occurrence pregnancyTest;

    @ElementCollection
    private List<Integer> calvingSequence;

    //Death
    @Enumerated(EnumType.STRING)
    private DeathMethod deathMethod;

    @Enumerated(EnumType.STRING)
    private DeathReason deathReason;

    @Enumerated(EnumType.STRING)
    private CarcassRating carcassRating;

    private String slaughterWeight;
    private String fatRating;

    //Weaning
    private boolean drinkingMilkAgain;

    //Condition Score
    private double score;

    //Milk Yield
    private int lactationNumber;
    private int kilograms;

    //Foot Bath
    private String chemical;

    @Enumerated(EnumType.STRING)
    private PlaceOfHabitatName footBathPlace;

    //Pregnancy Test
    @Enumerated(EnumType.STRING)
    private PregnantState pregnantState;

    @Enumerated(EnumType.STRING)
    private PregnancyMethod method;

    //Prophylactic

    //Castration Dehorning
    @Enumerated(EnumType.STRING)
    private Castration_DehorningType castrationType;

    //Hoof Care
    @Enumerated(EnumType.STRING)
    private HoofCareShape shape;

    @Enumerated(EnumType.STRING)
    private HoofCareMovement movement;

    @Enumerated(EnumType.STRING)
    private HoofCareType hoofCareType;

    @Transient
    private List<HoofCareInfo> hoofCareInfo;

    //Drying Off

    @Enumerated(EnumType.STRING)
    private DryingOffType dryingOffType;

    //Insemination

    @Enumerated(EnumType.STRING)
    private InseminationPerson inseminationPerson;

    @Enumerated(EnumType.STRING)
    private InseminationType inseminationType;

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            fetch = FetchType.LAZY)
    private Bull bull;

    public String getPregnantText() {

        if (pregnancyTest != null) {

            return pregnancyTest.getPregnantState().getText();

        } else return PregnantState.UNKNOWN.getText();

    }


    public String inseminationToString() {

        return date + " / " + getPregnantText() + " / " + bull.getBullBreed() + " / " + inseminationType.getText();

    }

    //Files
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "occurrence", fetch = FetchType.LAZY)
    private List<OccurrenceFile> FileList;

}
