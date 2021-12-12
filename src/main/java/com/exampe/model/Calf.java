package com.exampe.model;

import com.exampe.enums.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Getter
@Setter
@Entity
@NoArgsConstructor
public class Calf {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private int calfId;

    private boolean hidden;

    @OneToOne(cascade = CascadeType.PERSIST)
    private Occurrence calving;

    private boolean bornByCalving = false;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthDate;

    private int gestation;

    @Enumerated(EnumType.STRING)
    private Status status = Status.ALIVE;

    private int idOfMother;

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            fetch = FetchType.LAZY)
    private Bull father;

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            fetch = FetchType.LAZY)
    private Calf mother;

    @OneToMany(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH},
            mappedBy = "mother",
            fetch = FetchType.LAZY)
    private List<Calf> children;

    private String breed;

    public String getBreed() {

        if (mother != null) {

            BullBreed MF = mother.getFather().getBullBreed();
            BullBreed F = father.getBullBreed();

            return MF.name() + "x" + F.name();

        }

        return breed;

    }

    @Enumerated(EnumType.STRING)
    private Quantity quantity;

    @Enumerated(EnumType.STRING)
    private PlaceOfBirth birthPlace;

    @Enumerated(EnumType.STRING)
    private ColostrumByBottle colostrum;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    @Enumerated(EnumType.STRING)
    private Born born;

    @ElementCollection
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "births")
    private List<Birth> birthList;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "calf", fetch = FetchType.LAZY)
    private List<Bulling> bullingList = new LinkedList<>();

    public int getRealAge() {

        int age;

        if (!status.equals(Status.DEAD)) {
            age = (int) ChronoUnit.DAYS.between(birthDate, LocalDate.now());
        } else {

            Optional<Occurrence> death = occurrences.stream().
                    filter(o -> o.getOccurrenceType().equals(OccurrenceType.DEATH)).findAny();

            age = (int) ChronoUnit.DAYS.between(birthDate, death.get().getDate());

        }

        return age;

    }

    public BullingInfo getBullingInfo() {

        BullingInfo bullingInfo = new BullingInfo();

        boolean inseminationAbsent = occurrences.stream().noneMatch(o -> o.getOccurrenceType().equals(OccurrenceType.INSEMINATION));
        boolean calvingAbsent = occurrences.stream().noneMatch(o -> o.getOccurrenceType().equals(OccurrenceType.CALVING));
        boolean pregnancyTestAbsent = occurrences.stream().noneMatch(o -> o.getOccurrenceType().equals(OccurrenceType.PREGNANCY_TEST));
        boolean bullingAbsent = bullingList.isEmpty();

        if (inseminationAbsent && calvingAbsent && pregnancyTestAbsent) {

            bullingInfo.setDays(getRealAge());
            bullingInfo.setStatus(InseminationStatus.OPEN);

        } else {

            Occurrence lastCalving = null;
            Occurrence lastInsemination = null;
            Occurrence lastPregnancyTest = null;
            Bulling lastBulling = null;

            if (!calvingAbsent) {
                LinkedList<Occurrence> calvingList =
                        occurrences.stream().filter(o -> o.getOccurrenceType().equals(OccurrenceType.CALVING)).
                                collect(Collectors.toCollection(LinkedList::new));
                lastCalving = calvingList.getLast();
            }

            if (!inseminationAbsent) {
                LinkedList<Occurrence> inseminationList =
                        occurrences.stream().filter(o -> o.getOccurrenceType().equals(OccurrenceType.INSEMINATION)).
                                collect(Collectors.toCollection(LinkedList::new));
                lastInsemination = inseminationList.getLast();
            }

            if (!pregnancyTestAbsent) {
                LinkedList<Occurrence> pregnancyTestList =
                        occurrences.stream().filter(o -> o.getOccurrenceType().equals(OccurrenceType.PREGNANCY_TEST)).
                                collect(Collectors.toCollection(LinkedList::new));
                lastPregnancyTest = pregnancyTestList.getLast();
            }

            if (!bullingAbsent) {

                lastBulling = bullingList.get(bullingList.size() - 1);
            }

            if (lastCalving != null && lastInsemination != null) {
                if (lastCalving.getDate().isAfter(lastInsemination.getDate())) {
                    bullingInfo.setStatus(InseminationStatus.OPEN);
                    bullingInfo.setDays((int) ChronoUnit.DAYS.between(lastCalving.getDate(), LocalDate.now()));
                }
            }

            if (lastInsemination != null) {

                if ()

            }

//            if (!inseminationAbsent) {
//
//                if (!calvingAbsent) {
//
//                    if (lastCalving.getDate().isAfter(lastInsemination.getDate())) {
//
//                        bullingInfo.setDays((int) ChronoUnit.DAYS.between(lastCalving.getDate(), LocalDate.now()));
//                        bullingInfo.setStatus(InseminationStatus.OPEN);
//
//                    } else {
//
//                        if (!pregnancyTestAbsent) {
//
//                            switch (lastPregnancyTest.getPregnantState()) {
//
//                                case PREGNANT:
//                                    bullingInfo.setStatus(InseminationStatus.PREGNANT);
//                                    break;
//                                case NOT_PREGNANT:
//                                    bullingInfo.setStatus(InseminationStatus.OPEN);
//                                    break;
//                                case UNKNOWN:
//                                    bullingInfo.setStatus(InseminationStatus.INSEMINATED);
//                                    bullingInfo.setDays((int) ChronoUnit.DAYS.between(lastInsemination.getDate(), LocalDate.now()));
//                                    break;
//
//                            }
//
//
//                        } else {
//                            bullingInfo.setStatus(InseminationStatus.INSEMINATED);
//                            bullingInfo.setDays((int) ChronoUnit.DAYS.between(lastInsemination.getDate(), LocalDate.now()));
//                        }
//
//                    }
//
//                }
//
//            } else {
//
//                bullingInfo.setDays((int) ChronoUnit.DAYS.between(lastCalving.getDate(), LocalDate.now()));
//                bullingInfo.setStatus(InseminationStatus.OPEN);
//
//            }

        }

        return bullingInfo;

    }

    @ElementCollection(fetch = FetchType.LAZY)
    @CollectionTable(name = "places")
    private List<PlaceOfHabitat> places;

    @ElementCollection(fetch = FetchType.LAZY)
    @CollectionTable(name = "feed")
    private List<FeedHistory> feedingHistory;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "calf", fetch = FetchType.LAZY)
    private List<Occurrence> occurrences = new ArrayList<>();


    //Files
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "calf", fetch = FetchType.LAZY)
    private List<CalfFile> FileList;

}
