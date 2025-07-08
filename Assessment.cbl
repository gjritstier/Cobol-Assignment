       IDENTIFICATION DIVISION.
       PROGRAM-ID. SkillAssessment.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-Skill-Table.
           05 WS-Skill-Entry OCCURS 5 TIMES INDEXED BY IDX.
               10 WS-Skill-Name     PIC X(20).
               10 WS-Skill-Rating   PIC 9.

       01 WS-Total-Rating         PIC 9(3) VALUE 0.
       01 WS-Average-Rating       PIC 9(3)V9(2).
       01 WS-Count                PIC 9 VALUE 5.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           PERFORM INITIALIZE-DATA
           PERFORM CALCULATE-AVERAGE
           PERFORM DISPLAY-RESULTS
           STOP RUN
      * The full-stop, terminating the paragraph was missing, corrected this!
           .

       INITIALIZE-DATA.
           MOVE "Data Structures" TO WS-Skill-Name(1)
           MOVE 8 TO WS-Skill-Rating(1)

           MOVE "File Handling" TO WS-Skill-Name(2)
           MOVE 9 TO WS-Skill-Rating(2)

           MOVE "Table Processing" TO WS-Skill-Name(3)
           MOVE 7 TO WS-Skill-Rating(3)

           MOVE "String Manipulation" TO WS-Skill-Name(4)
           MOVE 8 TO WS-Skill-Rating(4)

           MOVE "Debugging" TO WS-Skill-Name(5)
      * The value was moved erroneously to table element 6
      * This level is out of bound and was changed to 5
           MOVE 9 TO WS-Skill-Rating(5)
           .

       CALCULATE-AVERAGE.
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > WS-Count
               ADD WS-Skill-Rating(IDX) TO WS-Total-Rating
           END-PERFORM
           COMPUTE WS-Average-Rating = WS-Total-Rating / WS-Count
           .

       DISPLAY-RESULTS.
           DISPLAY "COBOL Skill Assessment Results:"
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > WS-Count
               DISPLAY "Skill: " WS-Skill-Name(IDX)
               DISPLAY "Rating: " WS-Skill-Rating(IDX)
           END-PERFORM
           DISPLAY "Average Skill Rating: " WS-Average-Rating
           .
		   
