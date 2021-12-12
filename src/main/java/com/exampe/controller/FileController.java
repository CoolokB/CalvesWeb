package com.exampe.controller;

import com.exampe.model.Calf;
import com.exampe.model.CalfFile;
import com.exampe.model.Occurrence;
import com.exampe.model.OccurrenceFile;
import com.exampe.repos.CalfFileRepo;
import com.exampe.repos.CalfRepo;
import com.exampe.repos.OccurrenceFileRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Controller
public class FileController {

    @Value("${upload.path}")
    private  String uploadPath;

    @Autowired
    private CalfFileRepo calfFileRepo;

    @Autowired
    private OccurrenceFileRepo occurrenceFileRepo;

    public  void addFiles(Occurrence occurrence, MultipartFile[] files) {

        List<MultipartFile> fileList = new ArrayList<>(Arrays.asList(files));

        List<OccurrenceFile> occurrenceFiles = new ArrayList<>();

        fileList.forEach(f -> {

            if (f != null && !f.getOriginalFilename().isEmpty()) {

                OccurrenceFile occurrenceFile = new OccurrenceFile();

                File uploadDir = new File(uploadPath);

                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String uuidFile = UUID.randomUUID().toString();
                String resultFilename = uuidFile + "." + f.getOriginalFilename();

                try {
                    f.transferTo(new File(uploadPath + "/" + resultFilename));
                } catch (IOException e) {
                    e.printStackTrace();
                }

                occurrenceFile.setDate(LocalDate.now());
                occurrenceFile.setFileName(resultFilename);
                occurrenceFile.setFileOriginalName(f.getOriginalFilename());
                occurrenceFile.setOccurrence(occurrence);

                occurrenceFiles.add(occurrenceFile);

            }

        });

        occurrence.setFileList(occurrenceFiles);

    }

    @PostMapping("/addCalfFiles")
    public  String addCalfFilesPost(MultipartFile[] files, @RequestParam Calf calf) throws IOException {

        if (files[0].getSize() > 0) {

            addCalfFiles(files, calf);

        }

        return "redirect:/edit/" + calf.getId() + "#files/";

    }

    public void addCalfFiles(MultipartFile[] files,Calf calf) {

        List<MultipartFile> fileList = new ArrayList<>(Arrays.asList(files));

        List<CalfFile> calfFiles = new ArrayList<>();

        fileList.forEach(f -> {

            if (f != null && !f.getOriginalFilename().isEmpty()) {

                CalfFile calfFile = new CalfFile();

                File uploadDir = new File(uploadPath);

                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String uuidFile = UUID.randomUUID().toString();
                String resultFilename = uuidFile + "." + f.getOriginalFilename();

                try {
                    f.transferTo(new File(uploadPath + "/" + resultFilename));
                } catch (IOException e) {
                    e.printStackTrace();
                }

                calfFile.setDate(LocalDate.now());
                calfFile.setFileName(resultFilename);
                calfFile.setFileOriginalName(f.getOriginalFilename());
                calfFile.setCalf(calf);

                calfFiles.add(calfFile);

            }

        });

        calf.setFileList(calfFiles);

    }

    public static void deleteFileFromDisk(String fileName) throws IOException {

        String location = "C:\\Users\\Acer\\Desktop\\calvesWeb\\uploads\\img\\";

        String deletePath = location + fileName;

        Path path = Paths.get(deletePath);

        Files.delete(path);

    }

    @GetMapping("/deleteOccurrenceFile")
    public String deleteOccurrenceFile(@RequestParam Calf calf, String fileName) throws IOException {

        FileController.deleteFileFromDisk(fileName);

        OccurrenceFile occurrenceFile = occurrenceFileRepo.getByFileName(fileName);

        occurrenceFileRepo.delete(occurrenceFile);

        return "redirect:/edit/" + calf.getId() + "#treatment/";

    }

    @GetMapping("/deleteFile")
    public String deleteFile(@RequestParam Calf calf, String fileName) throws IOException {

        FileController.deleteFileFromDisk(fileName);

        CalfFile calfFile = calfFileRepo.getByFileName(fileName);

        calfFileRepo.delete(calfFile);

        return "redirect:/edit/" + calf.getId() + "#files/";

    }

}
