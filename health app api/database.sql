-- Table structure for table `qr_codes`
--

CREATE TABLE `qr_codes` (
  `codes` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `qr_codes`
--

INSERT INTO `qr_codes` (`codes`) VALUES
('1234shain'),
('2345Meke'),
('12345srvh'),
(''),
('Selma123'),
('Peter906'),
(''),
('test code'),
(''),
('new code'),
('5678');
 

-- Table structure for table `scanned_qr_code`
--

CREATE TABLE `scanned_qr_code` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `scanned_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `scanned_qr_code`
--

INSERT INTO `scanned_qr_code` (`scanned_code`) VALUES
('shfjk678'),
('jcszvbdn679'),
('shaintesting'),
('$qrText'),
('testing data'),
('another test data items'),
('testing he eck'),
('Selma123'),
('Peter906'),
('Peter906');

--
-- Indexes for table `scanned_qr_code`
--
ALTER TABLE `scanned_qr_code`
  ADD PRIMARY KEY (`ID`);


--
-- AUTO_INCREMENT for table `scanned_qr_code`
--
ALTER TABLE `scanned_qr_code`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
